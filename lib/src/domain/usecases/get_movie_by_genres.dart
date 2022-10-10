import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/src/core/error/failure.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';
import 'package:movieapp/src/domain/entity/movie.dart';
import 'package:movieapp/src/domain/repository/base_movie_repository.dart';

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

  const MovieByGenresParameters(this.genresId);

  @override
  List<Object> get props => [genresId];
}
