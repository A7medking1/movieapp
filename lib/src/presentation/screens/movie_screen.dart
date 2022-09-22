import 'package:flutter/material.dart';
import 'package:movieapp/src/data/datasource/movie_remote_data_source.dart';
import 'package:movieapp/src/data/repository/movie_repository.dart';
import 'package:movieapp/src/domain/repository/base_movie_repository.dart';
import 'package:movieapp/src/domain/usecases/get_now_playing_movies.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  void initState() {
    getMovie();
    super.initState();
  }

  void getMovie()async {
    MovieRemoteDataSource movieRemoteDataSource =  MovieRemoteDataSource();

    BaseMovieRepository movieRepository =  MovieRepository(movieRemoteDataSource);

    final result = await GetNowPlayingMoviesUseCase(movieRepository).execute();

    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
