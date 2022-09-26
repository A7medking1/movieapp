
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_use_case.dart';
import '../entity/movie.dart';
import '../repository/base_movie_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters> {
  BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure,List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getPopularMovies();
  }
}
