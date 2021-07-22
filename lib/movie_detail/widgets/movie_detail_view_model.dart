import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moviedb/core/common/constants.dart';
import 'package:moviedb/core/models/async_state.dart';
import 'package:moviedb/core/models/movie_detail.dart';
import 'package:moviedb/core/providers/storage_provider.dart';
import 'package:moviedb/core/services/movie_service.dart';

final movieDetailViewModelProvider =
StateNotifierProvider<MovieDetailViewModel, AsyncState<MovieDetail>>((ref) => MovieDetailViewModel(ref.read(movieServiceProvider), ref.read(storageProvider)));

class MovieDetailViewModel extends StateNotifier<AsyncState<MovieDetail>> {
  final MovieService _movieService;
  final FlutterSecureStorage _secureStorage;
  
  MovieDetailViewModel(this._movieService, this._secureStorage) : super(Initial(new MovieDetail(0, '', [], '', 0, 0, false)));

  loadData(String movieId) async {
    state = Loading(state.data);
    try {
      var movies = await _movieService.getMovieDetail(movieId);
      var favoriteIds = await getData(FAVOURITE_STORAGE_KEY);
      if (favoriteIds != null) {
        List<int> favoriteIdList = List.from(jsonDecode(favoriteIds.toString()));
        if (favoriteIdList.contains(movies.id)) {
          movies = new MovieDetail(movies.id, movies.title, movies.genres, movies.overview, movies.voteAverage, movies.voteCount, true);
        }
      }
      state = Success(movies);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }

  saveData(var data, String keyDb) async {
    String datas = jsonEncode(data);
    await _secureStorage.write(key: keyDb, value: datas);
  }

  getData(String keyDb) async{
    var datas = await _secureStorage.read(key: keyDb);
    if (datas == null) {
      return null;
    }
    return datas;
  }

  setFavorite(int movieId) async {
    var favoriteList = await _secureStorage.read(key: FAVOURITE_STORAGE_KEY);

    if (favoriteList == null) {
      List<int> favoriteIds = [movieId];
      saveData(favoriteIds, FAVOURITE_STORAGE_KEY);
    } else {
      List<int> favoriteIds = List.from(jsonDecode(favoriteList.toString()));

      if (favoriteIds.contains(movieId)) {
        favoriteIds.remove(movieId);
      } else {
        favoriteIds.add(movieId);
      }
      saveData(favoriteIds, FAVOURITE_STORAGE_KEY);
    }

    state = Success(new MovieDetail(state.data.id, state.data.title, state.data.genres, state.data.overview, state.data.voteAverage, state.data.voteCount, !state.data.favorite));
  }
}
