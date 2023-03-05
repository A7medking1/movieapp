import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failures.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';
import 'package:movieapp/src/tv/domin/repository/base_tv_repository.dart';

import '../entitiy/tv.dart';

class GetPopularTvShowUseCase extends BaseUseCase<List<Tv>, PopularTvShowParameters> {
  final BaseTvRepository baseTvRepository;

  GetPopularTvShowUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(PopularTvShowParameters parameters) async {
    return await baseTvRepository.getPopularTvShow(parameters);
  }
}

class PopularTvShowParameters extends Equatable {

  final int page;

  PopularTvShowParameters(this.page);

  @override
  List<Object> get props => [page];
}
