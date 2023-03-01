part of 'credit_info_bloc.dart';

class CreditInfoState extends Equatable {
  final Person? person;
  final RequestState personState;
  final String message;

   CreditInfoState({
     this.person,
    this.personState = RequestState.loading,
    this.message = '',
  });

  CreditInfoState copWith({
    Person? person,
    RequestState? personState,
    String? message,
  }) {
    return CreditInfoState(
      person: person ?? this.person,
      personState: personState ?? this.personState,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
    person,
    personState,
    message,
      ];
}
