import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failures.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';
import 'package:movieapp/src/tv/domin/repository/base_tv_repository.dart';

import '../entitiy/tv.dart';

class GetTrendingTvShowUseCase extends BaseUseCase<List<Tv>, TrendingTvShowParameters> {
  final BaseTvRepository baseTvRepository;

  GetTrendingTvShowUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(TrendingTvShowParameters parameters) async {
    return await baseTvRepository.getTrendingTvShow(parameters);
  }
}

class TrendingTvShowParameters extends Equatable {

  final int page;

  TrendingTvShowParameters(this.page);

  @override
  List<Object> get props => [page];
}
