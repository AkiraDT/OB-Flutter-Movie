import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/core/models/async_state.dart';
import 'package:moviedb/core/models/movie_favourite.dart';
import 'package:moviedb/core/services/movie_service.dart';

final favouriteMovieViewModelProvider = StateNotifierProvider<FavouriteMovieViewModel, AsyncState<List<MovieFavourite>>>((ref) => FavouriteMovieViewModel(ref.read(movieServiceProvider)));

class FavouriteMovieViewModel extends StateNotifier<AsyncState<List<MovieFavourite>>> {
  final MovieService _movieService;

  FavouriteMovieViewModel(this._movieService) : super(Initial([]));

  loadData() async {
    state = Loading(state.data);
    try {
      var movies = await _movieService.getFavoriteMovie();
      state = Success(movies);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }
}
