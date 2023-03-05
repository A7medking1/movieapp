import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failures.dart';
import '../../../core/use_case/base_use_case.dart';
import '../entity/movie.dart';
import '../repository/base_movie_repository.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>, TopRatedParameters> {
  BaseMovieRepository baseMovieRepository;

  GetTopRatedMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(TopRatedParameters parameters) async {
    return await baseMovieRepository.getTopRatedMovies(parameters);
  }

}

class TopRatedParameters extends Equatable {

  final int page;

  const TopRatedParameters(this.page);

  @override
  List<Object> get props => [page];
}
