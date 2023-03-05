import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';

import '../entity/genres.dart';
import '../repository/base_movie_repository.dart';

class GetGenresUseCase extends BaseUseCase<List<Genres>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetGenresUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Genres>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getGenres();
  }
}
