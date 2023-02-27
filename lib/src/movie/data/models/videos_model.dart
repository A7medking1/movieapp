
import '../../domain/entity/videos.dart';

class VideoModel extends Videos {
  const VideoModel({required super.id, required super.key});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json["id"],
      key: json["key"],
    );
  }
}
