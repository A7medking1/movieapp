import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/domain/usecases/credits_movie.dart';

import '../../../core/utils/enums.dart';
import '../../../domain/entity/movie.dart';

part 'credits_movies_event.dart';

part 'credits_movies_state.dart';

class CreditsMoviesBloc extends Bloc<CreditsMoviesEvent, CreditsMoviesState> {
  CreditsMoviesBloc(this.getCreditsMovieUseCase)
      : super(const CreditsMoviesState()) {
    on<GetCreditMoviesEvent>(_getCreditMovies);
  }

  final GetCreditsMovieUseCase getCreditsMovieUseCase;

  FutureOr<void> _getCreditMovies(
      GetCreditMoviesEvent event, Emitter<CreditsMoviesState> emit) async {
    final result =
        await getCreditsMovieUseCase(CreditsMovieParameters(event.id));

    result.fold(
      (l) => emit(
        state.copWith(
          creditMoviesState: RequestState.error,
          creditMoviesMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copWith(
          creditMoviesState: RequestState.loaded,
          creditMovies: r,
        ),
      ),
    );
  }
}
