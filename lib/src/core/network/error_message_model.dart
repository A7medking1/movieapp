import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final bool success;
  final String statusMessage;
  final int statusCode;

  const ErrorMessageModel({
    required this.success,
    required this.statusMessage,
    required this.statusCode,
  });


  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      success: json["success"],
      statusMessage: json["statusMessage"],
      statusCode: int.parse(json["statusCode"]),
    );
  }

  @override
  List<Object> get props => [success, statusMessage, statusCode];


}
