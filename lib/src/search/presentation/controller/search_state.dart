part of 'search_bloc.dart';

class SearchState extends Equatable {
  final List<Search> search;

  final SearchRequestState status;
  final String message;

  SearchState({
    this.search = const [],
    this.status = SearchRequestState.empty,
    this.message = '',
  });

  SearchState copyWith({
    List<Search>? search,
    SearchRequestState? status,
    String? message,
  }) {
    return SearchState(
      search: search ?? this.search,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [search, status, message];
}
