
import '../../domain/entity/credits.dart';

class CreditsModel extends Credits {
  const CreditsModel({
    required super.id,
    required super.originalName,
    required super.profilePath,
  });

  factory CreditsModel.fromJson(Map<String, dynamic> json) {
    return CreditsModel(
      id: json["id"],
      originalName: json["original_name"],
      profilePath: json["profile_path"],
    );
  }
}
