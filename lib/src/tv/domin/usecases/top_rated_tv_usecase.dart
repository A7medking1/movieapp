import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failures.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';
import 'package:movieapp/src/tv/domin/repository/base_tv_repository.dart';

import '../entitiy/tv.dart';

class GetTopRatedTvUseCae extends BaseUseCase<List<Tv>, TopRatedTvShowParameters> {
  final BaseTvRepository baseTvRepository;

  GetTopRatedTvUseCae(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(TopRatedTvShowParameters parameters) async {
    return await baseTvRepository.getTopRatedTvShow(parameters);
  }
}

class TopRatedTvShowParameters extends Equatable {

  final int page;

  TopRatedTvShowParameters(this.page);

  @override
  List<Object> get props => [page];
}
