class Movie
{
  late String title ;
  late String year;
  late String genre;
  late String imdbRating;
  late String poster;
  late String director;

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    genre = json['Genre'];
    imdbRating = json['imdbRating'];
    poster = json['Poster'];
    director = json['Director'];
  }
}