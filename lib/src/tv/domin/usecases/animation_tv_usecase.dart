import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';
import 'package:movieapp/src/tv/domin/repository/base_tv_repository.dart';

import '../../../core/error/failures.dart';
import '../entitiy/tv.dart';

class GetAnimationTvShowUseCase extends BaseUseCase<List<Tv>, AiringTodayTvShowParameters> {
  final BaseTvRepository baseTvRepository;

  GetAnimationTvShowUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(AiringTodayTvShowParameters parameters) async {
    return await baseTvRepository.getAnimationTvShow(parameters);
  }
}

class AiringTodayTvShowParameters extends Equatable {

  final int page;

  AiringTodayTvShowParameters(this.page);

  @override
  List<Object> get props => [page];
}
