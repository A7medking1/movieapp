import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/src/core/error/failure.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';

import '../entity/credits.dart';
import '../repository/base_movie_repository.dart';

class GetCreditsUseCase extends BaseUseCase<List<Credits>, CreditsParameters>
{

  BaseMovieRepository baseMovieRepository ;


  GetCreditsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Credits>>> call(CreditsParameters parameters) async{
    return await baseMovieRepository.getCredits(parameters);
  }

}

class CreditsParameters extends Equatable {
  final int id;

  const CreditsParameters(this.id);

  @override
  List<Object> get props => [];
}
