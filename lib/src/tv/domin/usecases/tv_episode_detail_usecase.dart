import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failures.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';
import 'package:movieapp/src/tv/domin/entitiy/episodes.dart';
import 'package:movieapp/src/tv/domin/repository/base_tv_repository.dart';

class GetTvSeasonDetailUseCase
    extends BaseUseCase<List<Episodes>, TvSeasonDetailParameters> {
  final BaseTvRepository baseTvRepository;

  GetTvSeasonDetailUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Episodes>>> call(
      TvSeasonDetailParameters parameters) async {
    return await baseTvRepository.getTvEpisodesDetail(parameters);
  }
}

class TvSeasonDetailParameters extends Equatable {
  final int tvId;
  final int seasonNumber;

  TvSeasonDetailParameters({
    required this.tvId,
    required this.seasonNumber,
  });

  @override
  List<Object> get props => [tvId,seasonNumber];
}
