import 'package:movieapp/src/tv/domin/entitiy/seasons.dart';

class SeasonsModel extends Seasons {
  SeasonsModel({
    required super.air_date,
    required super.episode_count,
    required super.id,
    required super.season_number,
    required super.name,
    required super.overview,
    required super.poster_path,
  });

  factory SeasonsModel.fromJson(Map<String, dynamic> json) {
    return SeasonsModel(
      air_date: json['air_date'] ?? '',
      id: json['id'],
      episode_count: json['episode_count'],
      season_number: json['season_number'],
      name: json['name'],
      overview: json['overview'],
      poster_path: json['poster_path'] ?? json['backdrop_path'],
    );
  }
}
