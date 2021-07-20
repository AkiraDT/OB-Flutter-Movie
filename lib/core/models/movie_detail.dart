class MovieDetail {
  final int id;
  final String title;
  final List<Genre> genres;
  final String overview;


  MovieDetail(this.id, this.title, this.genres, this.overview);
}

class Genre {
  final int id;
  final String name;

  Genre(this.id, this.name);
}