part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchError extends SearchState {

  final String message;


  const SearchError(this.message);

  @override
  List<Object> get props => [];
}


class SearchLoaded extends SearchState {

  final List<Movie> movie;

  const SearchLoaded({this.movie = const []});

  @override
  List<Object> get props => [movie];
}
