
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entity/movie.dart';
import '../repository/base_movie_repository.dart';

class GetPopularMoviesUseCase {
  BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUseCase(this.baseMovieRepository);

  Future<Either<Failure,List<Movie>>> execute() async {
    return await baseMovieRepository.getPopularMovies();
  }
}
