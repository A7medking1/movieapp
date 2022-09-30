import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/src/core/error/failure.dart';
import 'package:movieapp/src/domain/entity/videos.dart';
import 'package:movieapp/src/domain/repository/base_movie_repository.dart';

import '../../core/use_case/base_use_case.dart';

class GetVideosUseCase extends BaseUseCase<List<Videos>, VideoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetVideosUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Videos>>> call(VideoParameters parameters) async {
    return await baseMovieRepository.getVideos(parameters);
  }
}

class VideoParameters extends Equatable {
  final int id;

  const VideoParameters(this.id);

  @override
  List<Object> get props => [id];
}
