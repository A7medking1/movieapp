import 'package:equatable/equatable.dart';
import 'package:movieapp/src/movie/domain/entity/genres.dart';
import 'package:movieapp/src/tv/domin/entitiy/seasons.dart';
import 'package:movieapp/src/tv/domin/entitiy/tv.dart';

import '../../../movie/domain/entity/credits.dart';
import '../../../movie/domain/entity/videos.dart';


class TvDetail extends Equatable {
  final String posterPath;
  final String name;
  final List<Genres> genres;
  final int id;
  final int number_of_episodes;
  final int number_of_seasons;
  final String overview;
  final double voteAverage;
  final List<Seasons> seasons;
  final List<Tv> similar;
  final List<Videos> videos;
  final List<Credits> credits;



  TvDetail({
    required this.posterPath,
    required this.name,
    required this.genres,
    required this.id,
    required this.similar,
    required this.credits,
    required this.videos ,
    required this.number_of_episodes,
    required this.number_of_seasons,
    required this.overview,
    required this.voteAverage,
    required this.seasons,
  });

  @override
  List<Object> get props =>
      [
        posterPath,
        name,
        genres,
        id,
        number_of_episodes,
        number_of_seasons,
        overview,
        voteAverage,
        seasons,
        similar,
      ];
}