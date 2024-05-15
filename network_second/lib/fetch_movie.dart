import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:network_second/movie.dart';

Future<List<Movie>> fetchMovies() async {
  final response = await http.get(Uri.parse(
      'https://gist.githubusercontent.com/saniyusuf/406b843afdfb9c6a86e25753fe2761f4/raw/523c324c7fcc36efab8224f9ebb7556c09b69a14/Film.JSON'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonDataList = jsonDecode(response.body);
    return jsonDataList.map((json) => Movie.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load Movies');
  }
}