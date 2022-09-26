import 'package:movieapp/src/data/models/genres_model.dart';
import 'package:movieapp/src/domain/entity/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.releaseDate,
    required super.overview,
    required super.runtime,
    required super.voteAverage,
    required super.title,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      backdropPath: json["backdrop_path"],
      genres: List<GenresModel>.from(json["genres"].map((e) => GenresModel.fromJson(e))),
      id: json["id"],
      releaseDate: json["release_date"],
      overview: json["overview"],
      runtime: json["runtime"],
      title: json["title"],
      voteAverage: json["vote_average"],
    );
  }


}
