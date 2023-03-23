import 'package:dartz/dartz.dart';
import 'package:movieapp/src/core/error/exceptions.dart';
import 'package:movieapp/src/core/error/failures.dart';
import 'package:movieapp/src/search/data/datasource/search_remote_data_source.dart';
import 'package:movieapp/src/search/domain/entity/search.dart';
import 'package:movieapp/src/search/domain/repository/base_search_repo.dart';
import 'package:movieapp/src/search/domain/usecase/get_search.dart';

class SearchRepository extends BaseSearchRepository {

  final BaseRemoteSearchDataSource remoteSearchDataSource;


  SearchRepository(this.remoteSearchDataSource);

  @override
  Future<Either<Failure, List<Search>>> getSearch(SearchParameters parameters)async {
    try {
      final result = await remoteSearchDataSource.getSearch(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }


}