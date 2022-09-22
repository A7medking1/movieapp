
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entity/movie.dart';
import '../repository/base_movie_repository.dart';

class GetTopRatedMoviesUseCase {
  BaseMovieRepository baseMovieRepository;

  GetTopRatedMoviesUseCase(this.baseMovieRepository);

  Future<Either<Failure,List<Movie>>> execute() async {
    return await baseMovieRepository.getTopRatedMovies();
  }


}
