import 'package:dio/dio.dart';

abstract class Failure {}

class ServerFailure extends Failure {
  final String message;

  ServerFailure({required this.message});

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: 'Connection timeout with api server');

      case DioExceptionType.sendTimeout:
        return ServerFailure(message: 'Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: 'Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure(message: 'BadCertificate  with api server');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure(message: 'Request to  ApiServer was Canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(message: 'No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure(
            message: 'Opps There was an error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(
          message: 'Your request was noy found, please try latter');
    } else if (statusCode == 500) {
      return ServerFailure(
          message: 'There is a problem with server, please try latter');
    }
    else if (statusCode == 400 ||statusCode == 401||statusCode == 403) {
      return ServerFailure(message: response['error']['message']);
    }
    return ServerFailure(
        message: 'There was an error, Please try again');
  }
}

class CashFailure extends Failure {}

class NetWorkFailure extends Failure {}
