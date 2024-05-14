import 'dart:async';

import 'package:network/Network/api_response.dart';
import 'package:network/Repository/movie_repository.dart';

import '../Model/movie.dart';

class MovieBloc{
  late MovieRepository movieRepository;

  late StreamController<ApiResponse<List<Movie>>> _movieStreamController;

// I have changed the get API response to the get method;
   StreamSink<ApiResponse<List<Movie>>> get movieListSink =>
      _movieStreamController.sink;

   Stream<ApiResponse<List<Movie>>> get movieListStream =>
      _movieStreamController.stream;

  MovieBloc() {
    _movieStreamController = StreamController<ApiResponse<List<Movie>>>();
    movieRepository = MovieRepository();
    fetchMovieList();
  }

  fetchMovieList() async {
    movieListSink.add(ApiResponse.loading('Fetching Popular Movies'));
    try {
      List<Movie> movies = await movieRepository.fetchMovieList();
      movieListSink.add(ApiResponse.completed(movies));
    } catch (e) {
      movieListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _movieStreamController?.close();
  }
}