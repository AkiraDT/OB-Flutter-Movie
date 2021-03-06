import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/core/models/async_state.dart';
import 'package:moviedb/core/services/movie_service.dart';

final movieVideosViewModelProvider =
StateNotifierProvider(
        (ref) => MovieVideosViewModel(ref.read(movieServiceProvider)));

class MovieVideosViewModel extends StateNotifier {
  final MovieService _movieService;
  MovieVideosViewModel(this._movieService) : super(Initial({}));

  loadData(String movieId) async {
    state = Loading(state.data);
    try {
      var movies = await _movieService.getMovieVideo(movieId);
      state = Success(movies);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }
}
