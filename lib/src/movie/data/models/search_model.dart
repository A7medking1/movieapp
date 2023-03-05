import 'package:movieapp/src/movie/domain/entity/search.dart';

class SearchModel extends Search {
  SearchModel({
    required super.poster_path,
    required super.media_type,
    required super.vote_average,
    required super.id ,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      poster_path: json['poster_path'] ?? json['profile_path'],
      id: json['id'],
      vote_average: json['vote_average'] ?? 0.0,
      media_type: json['media_type'] ?? " ",
    );
  }
}
