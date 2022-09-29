import 'package:equatable/equatable.dart';

class Credits extends Equatable {
  final int id;

  final String originalName;
  final String? profilePath;

  const Credits({
    required this.id,
    required this.originalName,
     this.profilePath,
  });


  @override
  List<Object?> get props => [id, originalName, profilePath];


}
