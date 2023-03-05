
import 'package:dartz/dartz.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';

import '../../../core/error/failures.dart';
import '../entity/movie.dart';
import '../repository/base_movie_repository.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async{
    return await baseMovieRepository.getNowPlayingMovies();
  }


}
