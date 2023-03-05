import 'package:equatable/equatable.dart';
import 'package:movieapp/src/core/network/error_message_model.dart';

class ServerException extends Equatable implements Exception {
  final ErrorMessageModel? errorMessageModel;

  const ServerException([this.errorMessageModel]);

  @override
  List<Object?> get props => [errorMessageModel];


}

class FetchDataException extends ServerException {
  const FetchDataException([errorMessageModel]) : super(errorMessageModel);
}

class BadRequestException extends ServerException {
  const BadRequestException([errorMessageModel]) : super(errorMessageModel);
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException([errorMessageModel]) : super(errorMessageModel);
}

class NotFoundException extends ServerException {
  const NotFoundException([errorMessageModel]) : super(errorMessageModel);
}

class ConflictException extends ServerException {
  const ConflictException([errorMessageModel]) : super(errorMessageModel);
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException([errorMessageModel])
      : super(errorMessageModel);
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException([errorMessageModel])
      : super(errorMessageModel);
}

class CacheException implements Exception {}
