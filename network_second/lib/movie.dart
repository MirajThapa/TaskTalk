
class Movie {
  final String title;
  final String year;
  final String imdbRating;
  final String director;

  Movie({
    required this.title,
    required this.year,
    required this.imdbRating,
    required this.director,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'] ?? '',
      year: json['Year'] ?? '',
      imdbRating: json['imdbRating'] ?? '',
      director: json['Director'] ?? '',
    );
  }
}
