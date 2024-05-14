import 'package:flutter/material.dart';
import 'package:network/Model/movie.dart';
import 'package:network/Network/api_response.dart';
import 'package:network/bloc/movie_bloc.dart';

class MovieScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MovieScreenState();
  }
}

class _MovieScreenState extends State<MovieScreen> {
  late MovieBloc _movieBloc;

  @override
  void initState() {
    super.initState();
    _movieBloc = MovieBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie Mania')),
      backgroundColor: Colors.black54,
      body: RefreshIndicator(
        onRefresh: () => _movieBloc.fetchMovieList(),
        child: StreamBuilder<ApiResponse<List<Movie>>>(
          stream: _movieBloc.movieListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data!.status) {
                case Status.LOADING:
                  return Loading(loadingMessage: snapshot.data!.message);
                case Status.COMPLETED:
                  return MovieList(movieList: snapshot.data!.data);
                case Status.ERROR:
                  return Error(
                    errorMessage: snapshot.data!.message,
                    onRetryPressed: () => _movieBloc.fetchMovieList(),
                  );
              }
            }
            return Container();
          },
        ),
      ),
    );
  }
}

// Placeholder Widget for Loading
class Loading extends StatelessWidget {
  final String loadingMessage;

  const Loading({Key? key, required this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

// Placeholder Widget for Error
class Error extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetryPressed;

  const Error({
    Key? key,
    required this.errorMessage,
    required this.onRetryPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorMessage),
          ElevatedButton(
            onPressed: onRetryPressed,
            child: Text('Retry'),
          ),
        ],
      ),
    );
  }
}

// Placeholder Widget for Movie List
class MovieList extends StatelessWidget {
  final List<Movie> movieList;

  const MovieList({Key? key, required this.movieList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(movieList[index].title),
          // Add more details if needed
        );
      },
    );
  }
}
