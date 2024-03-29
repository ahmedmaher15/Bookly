import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}


class ServerFailure extends Failure {

  ServerFailure( super.message);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with api server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure('BadCertificate  with api server');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to  ApiServer was Canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure(
            'Opps There was an error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(
          'Your request was noy found, please try latter');
    } else if (statusCode == 500) {
      return ServerFailure(
          'There is a problem with server, please try latter');
    }
    else if (statusCode == 400 ||statusCode == 401||statusCode == 403) {
      return ServerFailure(response['error']['message']);
    }
    return ServerFailure(
        'There was an error, Please try again');
  }
}

class CashFailure extends Failure {
  CashFailure(super.message);
}

class NetWorkFailure extends Failure {
  NetWorkFailure(super.message);
}
