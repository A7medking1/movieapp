import 'package:dartz/dartz.dart';
import 'package:movieapp/src/search/domain/entity/search.dart';
import 'package:movieapp/src/search/domain/usecase/get_search.dart';

import '../../../core/error/failures.dart';

abstract class BaseSearchRepository {


  Future<Either<Failure,List<Search>>> getSearch(SearchParameters parameters);



}