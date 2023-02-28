part of 'pagination_bloc.dart';

abstract class PaginationEvent extends Equatable {
  const PaginationEvent();

  @override
  List<Object> get props => [];
}


class GetTvPaginationEvent extends PaginationEvent {

  final SeeMore tvSeeMore ;

  GetTvPaginationEvent(this.tvSeeMore);
}
class GetMoviePaginationEvent extends PaginationEvent {

  final SeeMore movieSeeMore ;

  GetMoviePaginationEvent(this.movieSeeMore);
}