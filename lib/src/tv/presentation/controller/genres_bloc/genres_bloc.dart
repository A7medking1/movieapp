import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/src/core/utils/enums.dart';
import 'package:movieapp/src/tv/domin/usecases/tv_genres_usecase.dart';

import '../../../../core/use_case/base_use_case.dart';
import '../../../../movie/domain/entity/genres.dart';



part 'genres_event.dart';

part 'genres_state.dart';

class TvGenresBloc extends Bloc<TvGenresEvent, TvGenresState> {
  TvGenresBloc(this.getTvGenresUseCase) : super(const TvGenresState()) {
    on<GetTvGenresEvent>(_getGenres);
  }

  final GetTvGenresUseCase getTvGenresUseCase;

  FutureOr<void> _getGenres(
      GetTvGenresEvent event, Emitter<TvGenresState> emit) async {
    final result = await getTvGenresUseCase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          requestState: RequestState.error,
        ),
      ),
      (r) => emit(state.copyWith(
        requestState: RequestState.loaded,
        genres: r,
      )),
    );
  }
}
