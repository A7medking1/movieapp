import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failures.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';
import 'package:movieapp/src/tv/domin/repository/base_tv_repository.dart';

import '../entitiy/tv.dart';

class GetWarTvShowUseCase extends BaseUseCase<List<Tv>, OnTheAirTvShowParameters> {
  final BaseTvRepository baseTvRepository;

  GetWarTvShowUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(OnTheAirTvShowParameters parameters) async {
    return await baseTvRepository.getWarTvShow(parameters);
  }
}

class OnTheAirTvShowParameters extends Equatable {

  final int page;

  OnTheAirTvShowParameters(this.page);

  @override
  List<Object> get props => [page];
}
