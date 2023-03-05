import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failures.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';
import 'package:movieapp/src/core/utils/enums.dart';
import 'package:movieapp/src/movie/domain/entity/search.dart';
import 'package:movieapp/src/tv/domin/entitiy/tv.dart';

import '../entity/movie.dart';
import '../repository/base_movie_repository.dart';

class SearchUseCase
    extends BaseUseCase<List<Search>, SearchParameters> {
  final BaseMovieRepository baseMovieRepository;

  SearchUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Search>>> call(
      SearchParameters parameters) async {
    return await baseMovieRepository.getSearch(parameters);
  }
}

class SearchParameters extends Equatable {
  final String query;
  final SearchType searchType;

  const SearchParameters({required this.query,required this.searchType});

  @override
  List<Object> get props => [query, searchType];
}
