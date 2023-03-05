import 'package:equatable/equatable.dart';
import 'package:movieapp/src/movie/data/models/person_model.dart';
import 'package:movieapp/src/tv/domin/entitiy/tv.dart';

import 'movie.dart';

class Person extends Equatable {
  final String name;

  final String? profile_path;

  final String place_of_birth;

  final String birthday;

  final List<Movie> movie_credits;

  final List<Tv> tv_credits;

  final List<ImagesModel> images ;

  Person({
    required this.name,
    required this.profile_path,
    required this.place_of_birth,
    required this.birthday,
    required this.movie_credits,
    required this.tv_credits,
    required this.images,
  });

  @override
  List<Object?> get props =>
      [
        name,
        profile_path,
        place_of_birth,
        images,
        birthday,
        movie_credits,
        tv_credits,
      ];


}
