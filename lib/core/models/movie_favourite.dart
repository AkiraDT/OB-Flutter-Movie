import 'movie.dart';

class MovieFavourite extends Movie {
  final String genres;
  final String ageRating;
  final int reviews;
  final int duration;
  final String synopsis;

  MovieFavourite(
      int id,
      String title,
      double rating,
      String poster,
      String backdrop,
      this.genres,
      this.ageRating,
      this.reviews,
      this.duration,
      this.synopsis,)
      : super(id, title, rating, poster, backdrop);
}
