part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetSearchMovieEvent extends SearchEvent {

  final String query;

  const GetSearchMovieEvent(this.query);
}