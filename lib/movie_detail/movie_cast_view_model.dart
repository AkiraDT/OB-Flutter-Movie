import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/core/models/async_state.dart';
import 'package:moviedb/core/models/movie_cast.dart';
import 'package:moviedb/core/services/movie_service.dart';

final movieCastViewModelProvider =
StateNotifierProvider<MovieCastViewModel, AsyncState<List<MovieCast>>>(
        (ref) => MovieCastViewModel(ref.read(movieServiceProvider)));

class MovieCastViewModel extends StateNotifier<AsyncState<List<MovieCast>>> {
  final MovieService _movieService;
  MovieCastViewModel(this._movieService) : super(Initial([]));

  loadData(String movieId) async {
    state = Loading(state.data);
    try {
      var movies = await _movieService.getMovieCast(movieId);
      state = Success(movies);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }
}
