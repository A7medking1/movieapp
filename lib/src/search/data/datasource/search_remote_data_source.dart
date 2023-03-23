import 'package:movieapp/src/core/api/api_consumer.dart';
import 'package:movieapp/src/core/utils/api_constance.dart';
import 'package:movieapp/src/search/data/models/search_model.dart';
import 'package:movieapp/src/search/domain/usecase/get_search.dart';

abstract class BaseRemoteSearchDataSource {
  Future<List<SearchModel>> getSearch(SearchParameters parameters);
}



class SearchDataSource extends BaseRemoteSearchDataSource {
  final ApiConsumer apiConsumer;

  SearchDataSource(this.apiConsumer);

  @override
  Future<List<SearchModel>> getSearch(SearchParameters parameters) async {
    final response = await apiConsumer.get(
      ApiConstance.searchPath(parameters.query, parameters.searchType),
    );
    return List<SearchModel>.from((response.data["results"] as List).map(
      (e) => SearchModel.fromJson(e),
    ));
  }
}
