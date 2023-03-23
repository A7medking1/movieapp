import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/src/search/domain/entity/search.dart';
import 'package:movieapp/src/search/domain/usecase/get_search.dart';

import '../../../core/utils/enums.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.searchUseCase) : super(SearchState()) {
    on<GetSearchEvent>(_getSearch);
  }

  final SearchUseCase searchUseCase;

  FutureOr<void> _getSearch(
      GetSearchEvent event, Emitter<SearchState> emit) async {
    if (event.query.trim().isEmpty) {
      return emit(
        state.copyWith(
          status: SearchRequestState.empty,
        ),
      );
    }

    emit(
      state.copyWith(
        status: SearchRequestState.loading,
      ),
    );

    final result = await searchUseCase(
        SearchParameters(query: event.query, searchType: event.searchType));

    result.fold(
      (l) => emit(state.copyWith(
        status: SearchRequestState.error,
        message: l.message,
      )),
      (r) {
        if (r.isEmpty) {
          emit(
            state.copyWith(
              status: SearchRequestState.noResults,
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: SearchRequestState.loaded,
              search: r.cast(),
            ),
          );
        }
      },
    );
  }
}
