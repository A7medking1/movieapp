import '../../domin/entitiy/tv.dart';

class TvModel extends Tv {
  TvModel({
    required super.id,
    required super.voteAverage,
    required super.poster_path,
    required super.overview,
    required super.title,
    required super.releaseDate,
    required super.genreIds,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) {
    return TvModel(
      id: json["id"],
      title: json["original_name"],
      overview: json["overview"],
      poster_path: json["poster_path"],
      releaseDate: json["release_date"] ?? "",
      genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      voteAverage: json["vote_average"].toDouble(),
    );
  }
}
