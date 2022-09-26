import 'package:movieapp/src/domain/entity/recommendations.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    required super.id,
    required super.backdropPath,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      id: json["id"],
      backdropPath: json["backdrop_path"] ?? "/aHUlWRhbp2OrVVgFTlB6ns86lEp.jpg",
    );
  }
}
