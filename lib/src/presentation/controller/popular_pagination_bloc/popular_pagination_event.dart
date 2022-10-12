part of 'popular_pagination_bloc.dart';

abstract class PopularPaginationEvent extends Equatable {
  const PopularPaginationEvent();

  @override
  List<Object> get props => [];
}


class GetPopularPaginationMoviesEvent extends PopularPaginationEvent {}

