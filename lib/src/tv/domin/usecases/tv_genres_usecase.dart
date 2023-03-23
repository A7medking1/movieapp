import 'package:dartz/dartz.dart';
import 'package:movieapp/src/movie/domain/entity/genres.dart';
import '../../../core/error/failures.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';
import 'package:movieapp/src/tv/domin/repository/base_tv_repository.dart';

class GetTvGenresUseCase
    extends BaseUseCase<List<Genres>, NoParameters> {
  final BaseTvRepository baseTvRepository;

  GetTvGenresUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Genres>>> call(NoParameters) async {
    return await baseTvRepository.getTvGenres();
  }
}
