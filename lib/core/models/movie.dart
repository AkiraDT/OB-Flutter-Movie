class Movie {
  final int id;
  final String title;
  final double rating;
  final String poster;
  final String backdrop;

  Movie(this.id, this.title, this.rating, this.poster, this.backdrop);

  Movie.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.title = json['title'],
        this.rating = json['rating'],
        this.poster = json['poster'],
        this.backdrop = json['backdrop'];

}