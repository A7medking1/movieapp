import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failures.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';

import '../entity/movie_detail.dart';
import '../repository/base_movie_repository.dart';
class GetMovieDetailUseCase extends BaseUseCase<MovieDetail, MovieDetailParameter> {
  final BaseMovieRepository baseMovieRepository;
  GetMovieDetailUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailParameter parameters) async {
    return await baseMovieRepository.getMovieDetails(parameters);
  }
}


class MovieDetailParameter extends Equatable {

  final int id;

  const MovieDetailParameter(this.id);


  @override
  List<Object> get props => [id];

}
