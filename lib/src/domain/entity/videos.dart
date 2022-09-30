import 'package:equatable/equatable.dart';

class Videos extends Equatable {
  final String id;

  final String key;

  const Videos({
    required this.id,
    required this.key,
  });


  @override
  List<Object> get props => [id, key];

}
