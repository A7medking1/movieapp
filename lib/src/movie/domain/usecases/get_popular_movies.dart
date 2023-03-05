import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failures.dart';
import '../../../core/use_case/base_use_case.dart';
import '../entity/movie.dart';
import '../repository/base_movie_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>, PopularMovieParameters> {
  BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(PopularMovieParameters parameters) async {
    return await baseMovieRepository.getPopularMovies(parameters);
  }
}

class PopularMovieParameters extends Equatable {

  final int page;

  const PopularMovieParameters(this.page);

  @override
  List<Object> get props => [page];
}
