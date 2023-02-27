import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/entity/movie.dart';
import '../../../domain/usecases/search_movies.dart';



part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.searchMoviesUseCase) : super(SearchInitial()) {
    on<GetSearchMovieEvent>(
      _searchMovie,
      transformer: (eventStream, mapper) => eventStream
          .where(
            (event) => event.query.length >= 3,
          )
          .debounceTime(const Duration(milliseconds: 600))
          .switchMap(mapper),
    );
  }

  final SearchMoviesUseCase searchMoviesUseCase;

  FutureOr<void> _searchMovie(
      GetSearchMovieEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoading());

   // print('call');

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
