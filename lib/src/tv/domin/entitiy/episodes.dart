import 'package:equatable/equatable.dart';

class Episodes extends Equatable {
  final String airDate;

  final String name;

  final String overview;

  final String? stillPath;

  final int episodeNumber;
  final int id;
  final int season_number;
  final double voteAverage;

  Episodes({
    required this.airDate,
    required this.name,
    required this.overview,
    required this.stillPath,
    required this.episodeNumber,
    required this.id,
    required this.season_number,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        airDate,
        name,
        overview,
        stillPath,
        episodeNumber,
        id,
        season_number,
        voteAverage,
      ];
}
