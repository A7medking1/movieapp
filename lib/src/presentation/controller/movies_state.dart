import 'package:equatable/equatable.dart';
import 'package:movieapp/src/core/utils/enums.dart';

import '../../domain/entity/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;

  final RequestState nowPlayingState;

  final String nowPlayingMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = "",
  });

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
      ];
}
