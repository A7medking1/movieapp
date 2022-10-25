import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/src/core/error/failure.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';
import 'package:movieapp/src/domain/repository/base_movie_repository.dart';

import '../entity/movie.dart';

class SearchMoviesUseCase
    extends BaseUseCase<List<Movie>, SearchMoviesParameters> {
  final BaseMovieRepository baseMovieRepository;

  SearchMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(
      SearchMoviesParameters parameters) async {
    return await baseMovieRepository.searchMovies(parameters);
  }
}

class SearchMoviesParameters extends Equatable {
  final String query;

  const SearchMoviesParameters(this.query);

  @override
  List<Object> get props => [query];
}
