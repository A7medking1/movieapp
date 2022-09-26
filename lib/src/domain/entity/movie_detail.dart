import 'package:equatable/equatable.dart';
import 'package:movieapp/src/domain/entity/genres.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final List<Genres> genres;
  final int id;
  final double voteAverage;
  final String releaseDate;
  final String overview;
  final int runtime;
  final String title;

  const MovieDetail({
    required this.backdropPath,
    required this.genres,
    required this.voteAverage,
    required this.title,
    required this.id,
    required this.releaseDate,
    required this.overview,
    required this.runtime,
  });

  @override
  List<Object> get props =>
      [
        backdropPath,
        genres,
        id,
        voteAverage,
        releaseDate,
        overview,
        runtime,
        title,
      ];
}
