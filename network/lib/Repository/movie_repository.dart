import 'package:network/Model/movie_response.dart';
import 'package:network/Network/api_helper.dart';

import '../Model/movie.dart';

class MovieRepository{
  final String api = '';
 
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Movie>> fetchMovieList() async{
    final response = await _helper.get('');
    return MovieResponse.fromJson(response).results;
  }

} 