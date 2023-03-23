import 'dart:async';

abstract class ApiConsumer {
  FutureOr get(String path, {Map<String, dynamic>? queryParameters});

  Future<dynamic> post(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters});

  Future<dynamic> put(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters});
}

// flutter pub add pretty_dio_logger
