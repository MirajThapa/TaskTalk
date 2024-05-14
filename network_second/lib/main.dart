import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> fetchMovies() async {
  final response = await http.get(Uri.parse(
      'https://gist.githubusercontent.com/saniyusuf/406b843afdfb9c6a86e25753fe2761f4/raw/523c324c7fcc36efab8224f9ebb7556c09b69a14/Film.JSON'));

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response,
    // then parse the JSON array.
    final List<dynamic> jsonDataList = jsonDecode(response.body);
    return jsonDataList.map((json) => Movie.fromJson(json)).toList();
  } else {
    // If the server does not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Movies');
  }
}

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

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Movie>> futureMovies;

  @override
  void initState() {
    super.initState();
    futureMovies = fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<List<Movie>>(
            future: futureMovies,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('No data available');
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final movie = snapshot.data![index];
                    return ListTile(
                      title: Text(movie.title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Year: ${movie.year}'),
                          Text('IMDb Rating: ${movie.imdbRating}'),
                          Text('Director: ${movie.director}'),
                        ],
                      ),
                      onTap: () {
                        
                      },
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
