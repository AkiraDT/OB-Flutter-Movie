import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/core/models/async_state.dart';
import 'package:moviedb/core/models/movie_detail.dart';
import 'package:moviedb/core/services/movie_service.dart';

final movieDetailViewModelProvider =
StateNotifierProvider<MovieDetailViewModel, AsyncState<MovieDetail>>((ref) => MovieDetailViewModel(ref.read(movieServiceProvider)));

class MovieDetailViewModel extends StateNotifier<AsyncState<MovieDetail>> {
  final MovieService _movieService;
  MovieDetailViewModel(this._movieService) : super(Initial(new MovieDetail(0, '', [], '')));

  loadData(String movieId) async {
    state = Loading(state.data);
    try {
      var movies = await _movieService.getMovieDetail(movieId);
      state = Success(movies);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }
}
