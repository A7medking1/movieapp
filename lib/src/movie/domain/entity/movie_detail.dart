import 'package:equatable/equatable.dart';
import 'package:movieapp/src/movie/domain/entity/credits.dart';
import 'package:movieapp/src/movie/domain/entity/videos.dart';

import 'genres.dart';
import 'movie.dart';

class MovieDetail extends Equatable {
  final String posterPath;
  final List<Genres> genres;
  final int id;
  final double voteAverage;
  final String releaseDate;
  final String overview;
  final int runtime;
  final String title;
  final List<Videos> videos;

  final List<Movie> similar;

  final List<Credits> credits;


  const MovieDetail({
    required this.posterPath,
    required this.genres,
    required this.voteAverage,
    required this.title,
    required this.id,
    required this.releaseDate,
    required this.overview,
    required this.runtime,
    required this.credits,
    required this.similar,
    required this.videos,
  });

  @override
  List<Object> get props =>
      [
        posterPath,
        genres,
        id,
        voteAverage,
        releaseDate,
        overview,
        runtime,
        title,
        videos,
        similar,
        credits,
      ];
}
