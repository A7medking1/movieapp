part of 'tv_bloc.dart';

abstract class TvPaginationEvent extends Equatable {
  const TvPaginationEvent();

  @override
  List<Object> get props => [];
}


class GetPagination extends TvPaginationEvent {

  final SeeMore seeMore ;

  GetPagination(this.seeMore);
}
