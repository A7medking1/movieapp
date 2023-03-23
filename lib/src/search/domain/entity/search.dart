import 'package:equatable/equatable.dart';

class Search extends Equatable {
  final String? poster_path;

  final int id ;

  final String media_type;

  final double vote_average;

  const Search({
    required this.poster_path,
    required this.media_type,
    required this.vote_average,
    required this.id ,
  });


  @override
  List<Object?> get props => [id , poster_path, media_type, vote_average];
}
