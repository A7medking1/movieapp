import 'package:equatable/equatable.dart';

class Tv extends Equatable {
  final int id;
  final double voteAverage;
  final String? poster_path;
  final String overview;
  final String title;
  final String? releaseDate;
  final List<int> genreIds;

  Tv({
    required this.id,
    required this.voteAverage,
    required this.poster_path,
    required this.overview,
    required this.title,
    required this.releaseDate,
    required this.genreIds,
  });

  @override
  List<Object?> get props => [
        id,
        voteAverage,
        poster_path,
        overview,
        title,
        releaseDate,
        genreIds,
      ];
}
