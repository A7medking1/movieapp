import 'package:movieapp/src/tv/domin/entitiy/episodes.dart';

class EpisodesModel extends Episodes {
  EpisodesModel({
    required super.airDate,
    required super.name,
    required super.overview,
    required super.stillPath,
    required super.episodeNumber,
    required super.id,
    required super.season_number,
    required super.voteAverage,
  });

  factory EpisodesModel.fromJson(Map<String, dynamic> json) {
    return EpisodesModel(
      airDate: json['air_date'] ?? '',
      name: json['name'],
      overview: json['overview'],
      stillPath: json['still_path'],
      episodeNumber: json['episode_number'],
      id: json['id'],
      season_number: json['season_number'],
      voteAverage: json['vote_average'],
    );
  }
}
