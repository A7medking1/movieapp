part of 'pagination_bloc.dart';

class PaginationState extends Equatable {


   final List<Tv> tvPagination;
   final List<Movie> moviePagination;


  PaginationState({
    this.tvPagination = const [],
    this.moviePagination = const [],
  });


  PaginationState copyWith({

    List<Tv>? tvPagination,
    List<Movie>? moviePagination,

  }) {
    return PaginationState(

      tvPagination: tvPagination ?? this.tvPagination,
      moviePagination: moviePagination ?? this.moviePagination


    );
  }

  @override
  List<Object> get props =>
      [
        tvPagination,
        moviePagination,
      ];
}
