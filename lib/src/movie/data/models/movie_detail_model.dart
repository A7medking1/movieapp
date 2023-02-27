
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
    );
  }
}
