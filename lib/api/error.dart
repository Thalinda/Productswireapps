import 'dart:developer';

import 'package:dio/dio.dart';

class DioExceptionSub implements Exception {
  late String errorMessage;

  DioExceptionSub.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        errorMessage = 'Request to the server was cancelled.';
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Connection timed out.';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Receiving timeout occurred.';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Request send timeout.';
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(
            dioError.response?.statusCode, dioError.response?.data['message']);
        break;
      case DioExceptionType.unknown:
        if (dioError.message != null &&
            dioError.message!.contains('SocketException')) {
          errorMessage = 'No Internet.';
          break;
        }
        errorMessage = 'Unexpected error occurred.';
        break;
      default:
        errorMessage = 'Something went wrong';
        break;
    }
  }

  String _handleStatusCode(int? statusCode, String message) {
    log("Code $message");
    switch (statusCode) {
      case 301:
        return message;
      case 400:
        return message;
      case 401:
        return message;
      case 403:
        return message;
      case 404:
        return message;
      case 405:
        return message;
      case 415:
        return message;
      case 422:
        return message;
      case 429:
        return message;
      case 500:
        return message;
      default:
        return message;
    }
  }

  @override
  String toString() => errorMessage;
}
