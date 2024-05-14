import 'package:network/Model/movie.dart';

class MovieResponse {
  late int totalResults;
  late List<Movie> results;
  
MovieResponse.fromJson(Map<String, dynamic> json) {
    totalResults = json['total_results'];
    if (json['results'] != null) {
      results = [];
      (json['results'] as List).forEach((v) {
        results.add(Movie.fromJson(v));
      });
    }
  }
}