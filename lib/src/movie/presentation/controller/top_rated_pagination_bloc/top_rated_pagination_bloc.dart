import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../../domain/entity/movie.dart';
import '../../../domain/usecases/get_top_rated_movies.dart';


part 'top_rated_pagination_event.dart';

part 'top_rated_pagination_state.dart';

class TopRatedPaginationBloc
    extends Bloc<TopRatedPaginationEvent, TopRatedPaginationState> {
  int page = 1;

  bool isLoading = false;

  TopRatedPaginationBloc(this.getTopRatedMoviesUseCase)
      : super(const TopRatedPaginationState()) {
    on<GetTopRatedPaginationMoviesEvent>(_getMovies);
  }

  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  FutureOr<void> _getMovies(GetTopRatedPaginationMoviesEvent event,
      Emitter<TopRatedPaginationState> emit) async {
    List<Movie> movie = [];
    final result = await getTopRatedMoviesUseCase(TopRatedParameters(page));

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
