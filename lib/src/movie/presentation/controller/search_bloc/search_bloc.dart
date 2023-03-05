import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/utils/enums.dart';
import 'package:movieapp/src/movie/domain/entity/search.dart';
import 'package:rxdart/rxdart.dart';


import '../../../domain/usecases/get_search.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.searchUseCase) : super(SearchInitial()) {
    on<GetSearchMovieEvent>(
      _searchMovie,
      transformer: (eventStream, mapper) => eventStream
          .where(
            (event) => event.query.length >= 3,
          )
          .debounceTime(const Duration(milliseconds: 600))
          .flatMap(mapper),
    );
  }

  final SearchUseCase searchUseCase;

  FutureOr<void> _searchMovie(
      GetSearchMovieEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoading());

    final results =
        await searchUseCase(SearchParameters(query: event.query,searchType: event.searchType));

    print(results);
    results.fold(
      (l) => emit(
        SearchError(
          l.message,
        ),
      ),
      (r) => emit(
        SearchLoaded(
          search: r,
        ),
      ),
    );
  }
}
