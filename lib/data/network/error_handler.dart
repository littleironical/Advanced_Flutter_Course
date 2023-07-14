import 'package:advanced_flutter_course/data/network/failure.dart';
import 'package:dio/dio.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unAuthorized,
  notFound,
  internalServerError,
  unknown,
  connectionTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if(error is DioException) {
      // DIO EXCEPTION - ITS FROM RESPONSE OF API
      failure = _handleError(error);
    }
    else {
      // DEFAULT ERROR
      failure = DataSource.unknown.getFailure();
    }
  }

  Failure _handleError(DioException error) {
    switch(error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.connectionTimeout.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioExceptionType.badResponse:
        switch(error.response?.statusCode) {
          case ResponseCode.badRequest:
            return DataSource.badRequest.getFailure();
          case ResponseCode.forbidden:
            return DataSource.forbidden.getFailure();
          case ResponseCode.unAuthorized:
            return DataSource.unAuthorized.getFailure();
          case ResponseCode.notFound:
            return DataSource.notFound.getFailure();
          case ResponseCode.internalServerError:
            return DataSource.internalServerError.getFailure();
          default:
            return DataSource.unknown.getFailure();
        }
      case DioExceptionType.badCertificate:
        return DataSource.cacheError.getFailure();
      case DioExceptionType.cancel:
        return DataSource.cancel.getFailure();
      case DioExceptionType.connectionError:
        return DataSource.noInternetConnection.getFailure();
      case DioExceptionType.unknown:
        return DataSource.unknown.getFailure();
    }
  }
}

class ResponseCode {
  // API STATUS CODES
  static const int success = 200; // SUCCESS WITH DATA
  static const int noContent = 201; // SUCCESS WITH NO CONTENT
  static const int badRequest = 400; // FAILURE, API REJECTED THE REQUEST
  static const int forbidden = 403; // API REJECTED THE REQUEST
  static const int unAuthorized = 401; // USER NOT AUTHORIZED
  static const int notFound = 404; // URL NOT FOUND
  static const int internalServerError = 500; // CRASH ON SERVER SIDE

  // LOCAL STATUS CODES
  static const int unknown = -1;
  static const int connectionTimeout = -2;
  static const int cancel = -3;
  static const int receiveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;
}

class ResponseMessage {
  // API STATUS CODES
  static const String success = 'SUCCESS WITH DATA';
  static const String noContent = 'SUCCESS WITH NO CONTENT';
  static const String badRequest = 'FAILURE, API REJECTED THE REQUEST';
  static const String forbidden = 'API REJECTED THE REQUEST';
  static const String unAuthorized = 'USER NOT AUTHORIZED';
  static const String notFound = 'URL NOT FOUND';
  static const String internalServerError = 'CRASH ON SERVER SIDE';

  // LOCAL STATUS CODES
  static const String unknown = 'Something went wrong, try again later';
  static const String connectionTimeout = 'Timeout, try again later';
  static const String cancel = 'Request cancelled, try again later';
  static const String receiveTimeout = 'Timeout, try again later';
  static const String sendTimeout = 'Timeout, try again later';
  static const String cacheError = 'Cache error, try again later';
  static const String noInternetConnection = 'Please check your internet connection';
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch(this) {
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unAuthorized:
        return Failure(ResponseCode.unAuthorized, ResponseMessage.unAuthorized);
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError, ResponseMessage.internalServerError);
      case DataSource.unknown:
        return Failure(ResponseCode.unknown, ResponseMessage.unknown);
      case DataSource.connectionTimeout:
        return Failure(ResponseCode.connectionTimeout, ResponseMessage.connectionTimeout);
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return Failure(ResponseCode.receiveTimeout, ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection, ResponseMessage.noInternetConnection);
      default:
        return Failure(ResponseCode.unknown, ResponseMessage.unknown);
    }
  }
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
