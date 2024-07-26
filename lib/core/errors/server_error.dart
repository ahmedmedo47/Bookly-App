import 'package:booklykian/core/errors/failure.dart';
import 'package:dio/dio.dart';

class ServerError extends Failure {
  const ServerError(super.message);

  factory ServerError.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return const ServerError('Request to API server was cancelled');
      case DioExceptionType.connectionTimeout:
        return const ServerError('Connection timeout with API server');
      case DioExceptionType.badCertificate:
        return const ServerError(
            'Bad certificate in connection with API server');
      case DioExceptionType.badResponse:
        return ServerError(dioError.response?.statusMessage ??
            'Received invalid response from API server');
      case DioExceptionType.connectionError:
        return const ServerError(
            'Connection to API server failed due to internet connection');
      case DioExceptionType.receiveTimeout:
        return const ServerError(
            'Receive timeout in connection with API server');
      case DioExceptionType.sendTimeout:
        return const ServerError('Send timeout in connection with API server');
      case DioExceptionType.unknown:
        return const ServerError('Something went wrong');
      default:
        return const ServerError('Something went wrong');
    }
  }

  factory ServerError.fromResponse(int statusCode, dynamic message) {
    if (statusCode == 400) {
      return const ServerError('Bad request');
    } else if (statusCode == 500) {
      return const ServerError('Server error');
    } else if (statusCode == 404) {
      return const ServerError('Endpoint not found');
    } else if (statusCode == 401) {
      return const ServerError('Unauthorised');
    } else if (statusCode == 403) {
      return const ServerError('Forbidden');
    }
    return ServerError(message['error']['message']);
  }
}
