import 'package:movieapp/src/movie/data/models/credits_model.dart';
import 'package:movieapp/src/movie/data/models/videos_model.dart';
import 'package:movieapp/src/tv/data/models/seasons_model.dart';
import 'package:movieapp/src/tv/data/models/tv_model.dart';
import 'package:movieapp/src/tv/domin/entitiy/tv_detail.dart';

import '../../../movie/data/models/genres_model.dart';

class TvDetailModel extends TvDetail {
  TvDetailModel({
    required super.posterPath,
    required super.name,
    required super.genres,
    required super.id,
    required super.number_of_episodes,
    required super.number_of_seasons,
    required super.overview,
    required super.voteAverage,
    required super.seasons,
    required super.videos,
    required super.credits,
    required super.similar,
  });

  factory TvDetailModel.fromJson(Map<String, dynamic> json) {
    return TvDetailModel(
      posterPath: json['poster_path'],
      name: json['name'],
      genres: List<GenresModel>.from(
          json["genres"].map((e) => GenresModel.fromJson(e))),
      id: json['id'],
      number_of_episodes: json['number_of_episodes'],
      number_of_seasons: json['number_of_seasons'],
      overview: json['overview'],
      voteAverage: json['vote_average'],
      credits: List<CreditsModel>.from(json['credits']['cast'].map((e) => CreditsModel.fromJson(e))),
      videos: List<VideoModel>.from(json['videos']['results'].map((e) => VideoModel.fromJson(e))),
      similar: List<TvModel>.from(json['similar']['results'].map((e) => TvModel.fromJson(e))),
      seasons: List<SeasonsModel>.from(
          json["seasons"].map((e) => SeasonsModel.fromJson(e))),
    );
  }
}

