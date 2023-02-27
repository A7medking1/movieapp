import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/utils/enums.dart';

import '../../../domain/entity/movie.dart';
import '../../../domain/usecases/get_popular_movies.dart';


part 'popular_pagination_event.dart';

part 'popular_pagination_state.dart';

class PopularPaginationBloc
    extends Bloc<PopularPaginationEvent, PopularPaginationState> {
  int page = 1;

  bool isLoading = false;

  PopularPaginationBloc(this.getPopularMoviesUseCase)
      : super(const PopularPaginationState()) {
    on<GetPopularPaginationMoviesEvent>(_getPopular);
  }

  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  FutureOr<void> _getPopular(GetPopularPaginationMoviesEvent event,
      Emitter<PopularPaginationState> emit) async {
    List<Movie> movie = [];
    final result = await getPopularMoviesUseCase(PopularMovieParameters(page));

    result.fold(
        (l) => emit(
              state.copyWith(
                message: l.message,
                requestState: RequestState.error,
              ),
            ), (r) {
      movie = r;
    });

    emit(state.copyWith(movie: state.movie + movie));

    isLoading = false;
  }
}
