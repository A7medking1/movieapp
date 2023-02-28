import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/src/core/error/failure.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';

import '../entity/movie.dart';
import '../repository/base_movie_repository.dart';

class GetCreditsMovieUseCase
    extends BaseUseCase<List<Movie>, CreditsMovieParameters> {

   BaseMovieRepository baseMovieRepository ;


   GetCreditsMovieUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(CreditsMovieParameters parameters) async{
   return await baseMovieRepository.getCreditsMovieInfo(parameters);
  }



}

class CreditsMovieParameters extends Equatable {
  final int personId;

  const CreditsMovieParameters(this.personId);

  @override
  List<Object> get props => [personId];
}
