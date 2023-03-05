import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failures.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';

import '../entity/movie.dart';
import '../repository/base_movie_repository.dart';

class GetMoviesByGenresUseCase
    extends BaseUseCase<List<Movie>, MovieByGenresParameters> {


  final BaseMovieRepository baseMovieRepository;


  GetMoviesByGenresUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(MovieByGenresParameters parameters) async{
    return await baseMovieRepository.getMoviesByGenres(parameters);
  }
}

class MovieByGenresParameters extends Equatable {
  final int genresId;
  final int page;

  const MovieByGenresParameters({required this.genresId,required this.page});

  @override
  List<Object> get props => [genresId ,page];
}
