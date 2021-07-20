import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/core/common/constants.dart';
import 'package:moviedb/core/models/movie.dart';
import 'package:moviedb/core/models/movie_cast.dart';
import 'package:moviedb/core/models/movie_detail.dart';
import 'package:moviedb/core/models/movie_video.dart';
import 'package:moviedb/core/providers/dio_provider.dart';

final movieServiceProvider =
    Provider((ref) => MovieService(ref.read(dioProvider)));

class MovieService {
  final Dio _dio;

  MovieService(this._dio);

  Future<List<Movie>> getPopularMovie(int page) async {
    List<Movie> movies = [];
    var response = await _dio.get(
        '${API_URL}discover/movie?api_key=${API_KEY}&language=en-US&sort_by=popularity.desc&include_adult=true&include_video=false&page=1&with_watch_monetization_types=flatrate');

    if (response.data.length > 0) {
      if (response.data['results'].length > 0) {
        for (var movieRes in response.data['results']) {
          Movie newMovie = new Movie(
            movieRes['id'],
            movieRes['title'],
            double.parse(movieRes['vote_average'].toString()),
            'https://www.themoviedb.org/t/p/w300${movieRes['poster_path']}',
            'https://www.themoviedb.org/t/p/w780${movieRes['backdrop_path']}',
          );
          movies.add(newMovie);
        }
      }
    }

    return movies;
  }

  Future<List<Movie>> getUpcoming(int page, int pageSize) async {
    List<Movie> movies = [];
    var response = await _dio.get(
        '${API_URL}movie/upcoming?api_key=${API_KEY}&language=en-US&page=1');

    if (response.data.length > 0) {
      if (response.data['results'].length > 0) {
        for (var movieRes in response.data['results']) {
          Movie newMovie = new Movie(
              movieRes['id'],
              movieRes['title'],
              double.parse(movieRes['vote_average'].toString()),
              'https://www.themoviedb.org/t/p/w300${movieRes['poster_path']}',
              'https://www.themoviedb.org/t/p/w780${movieRes['backdrop_path']}');
          movies.add(newMovie);
          if (movies.length == pageSize) {
            break;
          }
        }
      }
    }

    return movies;
  }

  Future<MovieDetail> getMovieDetail(String movieId) async {
    MovieDetail movie = new MovieDetail(0, '', [], '');
    var response = await _dio
        .get('${API_URL}movie/${movieId}?api_key=${API_KEY}&language=en-US');

    if (response.data.length > 0) {
      List<Genre> genres = [];
      for (var gen in response.data['genres']) {
        Genre genre = new Genre(gen['id'], gen['name']);
        genres.add(genre);
      }
      movie = new MovieDetail(
        response.data['id'],
        response.data['title'],
        genres,
        response.data['overview'],
      );
    }

    return movie;
  }


  Future<MovieVideo> getMovieVideo(String movieId) async {
    MovieVideo movie = new MovieVideo('', '', '', '', '');
    var response = await _dio
        .get('${API_URL}movie/${movieId}/videos?api_key=${API_KEY}&language=en-US');

    if (response.data.length > 0) {
      if (response.data['results'].length > 0) {
        var video = response.data['results'].elementAt(0);
        movie = new MovieVideo(
          video['id'],
          video['name'],
          video['key'],
          video['site'],
          video['size'].toString(),
        );
      }
    }

    return movie;
  }

  Future<List<MovieCast>> getMovieCast(String movieId) async {
    List<MovieCast> movieCast = [];
    var response = await _dio
        .get('${API_URL}movie/${movieId}/credits?api_key=${API_KEY}&language=en-US');

    if (response.data.length > 0) {
      if (response.data['cast'].length > 0) {
        for (var castDat in response.data['cast']) {
          MovieCast cast = new MovieCast(
            castDat['id'],
            castDat['gender'],
            castDat['known_for_department'],
            castDat['name'],
            castDat['original_name'],
            castDat['popularity'],
            'https://www.themoviedb.org/t/p/w300${castDat['profile_path']}',
            castDat['character'],
          );
          movieCast.add(cast);
        }
      }
    }

    return movieCast;
  }
}
