import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/src/core/error/failures.dart';
import 'package:movieapp/src/tv/domin/entitiy/tv.dart';
import 'package:movieapp/src/tv/domin/usecases/tvs_shows_by_genres_usecase.dart';

import '../../../../core/utils/enums.dart';

part 'tv_shows_by_genres_event.dart';

part 'tv_shows_by_genres_state.dart';

class TvShowsByGenresBloc
    extends Bloc<TvShowsByGenresEvent, TvShowsByGenresState> {
  TvShowsByGenresBloc(this._getTvsShowsByGenresUseCase)
      : super(TvShowsByGenresState()) {
    on<GetTvShowsByGenresEvent>(_getTvByGenres);
  }

  final GetTvsShowsByGenresUseCase _getTvsShowsByGenresUseCase;

  int page = 1;

  FutureOr<void> _getTvByGenres(
      GetTvShowsByGenresEvent event, Emitter<TvShowsByGenresState> emit) async {
    Either<Failure, List<Tv>> result = await _getTvsShowsByGenresUseCase(
      TvsShowsByGenresParameters(
        genresId: event.genresId,
        page: page,
      ),
    );


    result.fold(
      (l) => emit(
        state.copyWith(
          requestState: RequestState.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          requestState: RequestState.loaded,
          tv: state.tv + r ,
        ),
      )
    );
  }
}
