import 'package:dio/dio.dart';

abstract class Failure {}

class ServerFailure extends Failure {
  final String message;

  ServerFailure({required this.message});

  factory ServerFailure.fromDioError(DioError e) {
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
        return ServerFailure(message: 'BadResponse  with api server');

      case DioExceptionType.cancel:
        return ServerFailure(message: 'Request to  ApiServer was Canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(message: 'No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure(
            message: 'Opps There was an error, Please try again');
    }
  }
}

class CashFailure extends Failure {}

class NetWorkFailure extends Failure {}
