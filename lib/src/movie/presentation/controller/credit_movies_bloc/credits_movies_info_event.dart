part of 'credits_movies_info_bloc.dart';

abstract class CreditsMoviesEvent extends Equatable {
  const CreditsMoviesEvent();

  @override
  List<Object> get props => [];
}


class GetCreditMoviesEvent extends CreditsMoviesEvent {

  final int id;

  const GetCreditMoviesEvent(this.id);


  @override
  List<Object> get props => [id];


}

