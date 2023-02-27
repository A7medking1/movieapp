import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/src/core/utils/enums.dart';

import '../../../../core/use_case/base_use_case.dart';
import '../../../domain/entity/genres.dart';
import '../../../domain/usecases/get_genres.dart';


part 'genres_event.dart';

part 'genres_state.dart';

class GenresBloc extends Bloc<GenresEvent, GenresState> {
  GenresBloc(this.getGenresUseCase) : super(const GenresState()) {
    on<GetGenresEvent>(_getGenres);
  }

  final GetGenresUseCase getGenresUseCase;

  FutureOr<void> _getGenres(
      GetGenresEvent event, Emitter<GenresState> emit) async {
    final result = await getGenresUseCase(const NoParameters());

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
