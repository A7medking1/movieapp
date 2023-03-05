import 'package:equatable/equatable.dart';
import 'package:movieapp/src/movie/data/models/movie_model.dart';
import 'package:movieapp/src/movie/domain/entity/person.dart';
import 'package:movieapp/src/tv/data/models/tv_model.dart';

class PersonModel extends Person {
  PersonModel({
    required super.name,
    required super.profile_path,
    required super.place_of_birth,
    required super.birthday,
    required super.movie_credits,
    required super.tv_credits,
    required super.images,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      name: json['name'],
      profile_path: json['profile_path'],
      place_of_birth: json['place_of_birth'],
      birthday: json['birthday'],
      movie_credits: List<MovieModel>.from(
          json['movie_credits']['cast'].map((e) => MovieModel.fromJson(e))),
      tv_credits: List<TvModel>.from(
          json['tv_credits']['cast'].map((e) => TvModel.fromJson(e))),
      images: List<ImagesModel>.from(
          json['images']['profiles'].map((e) => ImagesModel.fromJson(e))) ,
    );
  }
}

class ImagesModel extends Equatable {

  final String? file_path;

  const ImagesModel({required this.file_path});


  factory ImagesModel.fromJson(Map<String, dynamic> json) {
    return ImagesModel(file_path: json["file_path"],);
  }

  @override
  List<Object?> get props => [file_path];


}
