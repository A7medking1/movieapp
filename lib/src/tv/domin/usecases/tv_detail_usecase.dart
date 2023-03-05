import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failures.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';
import 'package:movieapp/src/tv/domin/entitiy/tv_detail.dart';
import 'package:movieapp/src/tv/domin/repository/base_tv_repository.dart';

import '../entitiy/tv.dart';

class GetTvDetailUseCase extends BaseUseCase<TvDetail, TvDetailParameters> {
  final BaseTvRepository baseTvRepository;

  GetTvDetailUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure,TvDetail>> call(TvDetailParameters parameters) async {
    return await baseTvRepository.getTvDetail(parameters);
  }
}

class TvDetailParameters extends Equatable {

  final int id;

  TvDetailParameters(this.id);

  @override
  List<Object> get props => [id];
}
