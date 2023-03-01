part of 'credit_info_bloc.dart';

abstract class CreditInfoEvent extends Equatable {
  const CreditInfoEvent();

  @override
  List<Object> get props => [];
}


class GetCreditInfoEvent extends CreditInfoEvent {

  final int id;

  const GetCreditInfoEvent(this.id);


  @override
  List<Object> get props => [id];


}

