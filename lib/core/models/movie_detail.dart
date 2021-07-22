class MovieDetail {
  final int id;
  final String title;
  final List<Genre> genres;
  final String overview;
  final double voteAverage;
  final int voteCount;
  final bool favorite;


  MovieDetail(this.id, this.title, this.genres, this.overview, this.voteAverage, this.voteCount, this.favorite);
}

class Genre {
  final int id;
  final String name;

  Genre(this.id, this.name);
}