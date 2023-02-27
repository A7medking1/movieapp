import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/src/core/error/failure.dart';

import '../../../core/use_case/base_use_case.dart';
import '../entity/recommendations.dart';
import '../repository/base_movie_repository.dart';

class GetMovieRecommendationsUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationsParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieRecommendationsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationsParameters parameters) async {
    return await baseMovieRepository.getRecommendations(parameters);
  }
}

class RecommendationsParameters extends Equatable {
  final int id;

  const RecommendationsParameters(this.id);

  @override
  List<Object> get props => [id];
}
