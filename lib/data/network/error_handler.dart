import 'failure.dart';
import 'package:dio/dio.dart';


class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return DataSource.CONTENT_TIMEOUT.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioErrorType.response:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(error.response?.statusCode ?? 0,
            error.response?.statusMessage ?? "");
      } else {
        return DataSource.DEFAULT.getFailure();
      }
      case DioErrorType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioErrorType.other:
      return DataSource.DEFAULT.getFailure();
  }
}

enum DataSource {
  SUCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDEN,
  UNAUTHORIZED,
  NOTFOUND,
  INTERNAL_SERVER_ERROR,
  CONTENT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CASHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found

//local status code
  static const int CONTENT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CASHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String SUCCESS = "success"; // success with data
  static const String NO_CONTENT =
      "success"; // success with no data (no content)
  static const String BAD_REQUEST =
      "Bad request, Try again later"; // failure, API rejected request
  static const String UNAUTORISED =
      "User is unauthorised, Try again later"; // failure, user is not authorised
  static const String FORBIDDEN =
      "Forbidden request, Try again later"; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      "Some thing went wrong, Try again later"; // failure, crash in server side

  // local status code
  static const String CONNECT_TIMEOUT = "Time out error, Try again later";
  static const String CANCEL = "Request was cancelled, Try again later";
  static const String RECIEVE_TIMEOUT = "Time out error, Try again later";
  static const String SEND_TIMEOUT = "Time out error, Try again later";
  static const String CACHE_ERROR = "Cache error, Try again later";
  static const String NO_INTERNET_CONNECTION =
      "Please check your internet connection";
  static const String DEFAULT = "Some thing went wrong, Try again later";
  static const String NOT_FOUND = "Some thing went wrong, Try again later";
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);
      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORIZED:
        return Failure(ResponseCode.UNAUTORISED, ResponseMessage.UNAUTORISED);
      case DataSource.NOTFOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONTENT_TIMEOUT:
        return Failure(
            ResponseCode.CASHE_ERROR, ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(
            ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.CASHE_ERROR:
        return Failure(ResponseCode.CASHE_ERROR, ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
  return Failure(ResponseCode.DEFAULT,
            ResponseMessage.DEFAULT);       
    }
  }
}

class ApiInternalStatus{
  static const int Sucess=0;
  static const int Failure=1;
}
