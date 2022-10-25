import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/domain/usecases/search_movies.dart';

import '../../../domain/entity/movie.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.searchMoviesUseCase) : super(SearchInitial()) {
    on<GetSearchMovieEvent>(_searchMovie);
  }

  final SearchMoviesUseCase searchMoviesUseCase;

  FutureOr<void> _searchMovie(
      GetSearchMovieEvent event, Emitter<SearchState> emit) async {

    emit(SearchLoading());

    final results =
        await searchMoviesUseCase(SearchMoviesParameters(event.query));

    results.fold(
      (l) => emit(
        SearchError(
          l.message,
        ),
      ),
      (r) => emit(
        SearchLoaded(
          movie: r,
        ),
      ),
    );
  }
}
