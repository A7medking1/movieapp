import 'package:movieapp/src/movie/data/models/credits_model.dart';
import 'package:movieapp/src/movie/data/models/movie_model.dart';
import 'package:movieapp/src/movie/data/models/videos_model.dart';

import '../../domain/entity/movie_detail.dart';
import 'genres_model.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel({
    required super.posterPath,
    required super.genres,
    required super.id,
    required super.releaseDate,
    required super.overview,
    required super.runtime,
    required super.voteAverage,
    required super.title,
    required super.videos,
    required super.credits,
    required super.similar,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      posterPath: json["poster_path"],
      genres: List<GenresModel>.from(
          json["genres"].map((e) => GenresModel.fromJson(e))),
      id: json["id"],
      releaseDate: json["release_date"],
      overview: json["overview"],
      runtime: json["runtime"],
      title: json["title"],
      voteAverage: json["vote_average"],
      similar: List<MovieModel>.from(
          json['similar']['results'].map((e) => MovieModel.fromJson(e))),
      videos: List<VideoModel>.from(
          json['videos']['results'].map((e) => VideoModel.fromJson(e))),
      credits: List<CreditsModel>.from(
          json['credits']['cast'].map((e) => CreditsModel.fromJson(e))),
    );
  }
}
