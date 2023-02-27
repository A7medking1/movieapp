part of 'top_rated_pagination_bloc.dart';

abstract class TopRatedPaginationEvent extends Equatable {
  const TopRatedPaginationEvent();

  @override
  List<Object> get props => [];
}


class GetTopRatedPaginationMoviesEvent extends TopRatedPaginationEvent {}

