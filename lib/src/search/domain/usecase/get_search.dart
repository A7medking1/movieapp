import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/src/core/error/failures.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';
import 'package:movieapp/src/core/utils/enums.dart';
import 'package:movieapp/src/search/domain/entity/search.dart';
import 'package:movieapp/src/search/domain/repository/base_search_repo.dart';

class SearchUseCase
    extends BaseUseCase<List<Search>, SearchParameters> {
  final BaseSearchRepository searchRepo;

  SearchUseCase(this.searchRepo);

  @override
  Future<Either<Failure, List<Search>>> call(
      SearchParameters parameters) async {
    return await searchRepo.getSearch(parameters);
  }
}

class SearchParameters extends Equatable {
  final String query;
  final SearchType searchType;

  const SearchParameters({required this.query,required this.searchType});

  @override
  List<Object> get props => [query, searchType];
}
