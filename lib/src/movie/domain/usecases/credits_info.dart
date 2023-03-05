import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failures.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';
import 'package:movieapp/src/movie/domain/entity/person.dart';

import '../entity/movie.dart';
import '../repository/base_movie_repository.dart';

class GetCreditInfoUseCase
    extends BaseUseCase<Person, CreditInfoParameters> {

   BaseMovieRepository baseMovieRepository ;


   GetCreditInfoUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, Person>> call(CreditInfoParameters parameters) async{
   return await baseMovieRepository.getCreditInfo(parameters);
  }
}

class CreditInfoParameters extends Equatable {
  final int personId;

  const CreditInfoParameters(this.personId);

  @override
  List<Object> get props => [personId];
}
