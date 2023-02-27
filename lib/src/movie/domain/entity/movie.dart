import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final double voteAverage;
  final String? backdropPath;
  final String overview;
  final String title;
  final String? releaseDate;
  final List<int> genreIds;

  const Movie({
    required this.id,
    required this.releaseDate,
    required this.voteAverage,
    required this.backdropPath,
    required this.overview,
    required this.title,
    required this.genreIds,
  });

  @override
  List<Object?> get props => [
        id,
        voteAverage,
        backdropPath,
        releaseDate,
        overview,
        title,
        genreIds,
      ];
}
