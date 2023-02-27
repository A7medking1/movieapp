import 'package:equatable/equatable.dart';

class Seasons extends Equatable {
  final String air_date;
  final int episode_count;
  final int id;
  final int season_number;
  final String name;

  final String overview;
  final String? poster_path;

  Seasons({
    required this.air_date,
    required this.episode_count,
    required this.id,
    required this.season_number,
    required this.name,
    required this.overview,
    required this.poster_path,
  });



  @override
  List<Object?> get props =>
      [
        air_date,
        episode_count,
        id,
        season_number,
        name,
        overview,
        poster_path,
      ];
}
