import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/src/tv/domin/entitiy/tv.dart';
import 'package:movieapp/src/tv/domin/entitiy/tv.dart';
import 'package:movieapp/src/tv/domin/repository/base_tv_repository.dart';
import '../../../core/error/failures.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';


class GetTvsShowsByGenresUseCase
    extends BaseUseCase<List<Tv>, TvsShowsByGenresParameters> {


  final BaseTvRepository baseTvRepository;


  GetTvsShowsByGenresUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(TvsShowsByGenresParameters parameters) async{
    return await baseTvRepository.getTvsShowsByGenres(parameters);
  }
}

class TvsShowsByGenresParameters extends Equatable {
  final int genresId;
  final int page;

  const TvsShowsByGenresParameters({required this.genresId,required this.page});

  @override
  List<Object> get props => [genresId ,page];
}
