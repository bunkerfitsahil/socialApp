import 'dart:io';

import 'package:dio/dio.dart';

class DionewExceptions implements Exception {
  static String getExceptions(error) {
    String message = "";

    @override
    String toString() => message;
    if (error is Exception) {
      print("testerror" + "isexception");
      try {
        if (error is DioError) {
          print("testerror" + "isDioerror");
          print("testerror" + error.type.toString());

          switch (error.type) {
            case DioErrorType.cancel:
              message = "Request to API server was cancelled";
              break;
            case DioErrorType.connectTimeout:
              message = "Connection timeout with API server";
              break;
            case DioErrorType.other:
              message = " No internet connection";
              break;
            case DioErrorType.receiveTimeout:
              message = "Receive timeout in connection with API server";
              break;
            case DioErrorType.response:
              message = _handleError(error.response!.statusCode!, error);
              break;
            case DioErrorType.sendTimeout:
              message = "Send timeout in connection with API server";
              break;
            default:
              message = "Something went wrong";
              break;
          }
        } else if (error is SocketException) {
          return "No internet connection";
        } else {
          return "Unexpected error occurred";
        }
      } on FormatException catch (e) {
        // Helper.printError(e.toString());
        return "Unexpected error occurred";
      } catch (_) {
        return "Unexpected error occurred";
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return "Unable to process the data";
      } else {
        return "Unexpected error occurred";
      }
    }
    return message;
  }

  static String _handleError(int statusCode, DioError error) {
    var tempMessage = null;
    print("testmessage" + statusCode.toString());
    if (error.response != null) {
      tempMessage = error.response!.data;
      print("testmessage" + tempMessage);
      print("testmessage" + tempMessage);
      if (tempMessage.length > 50) {
        tempMessage = "something went wrong";
      }
    }
    switch (statusCode) {
      case 400:
        return tempMessage ?? 'Bad request';
      case 403:
        return tempMessage ?? "Unauthorized request";
      case 404:
        return tempMessage ?? "";
      case 409:
        return tempMessage ?? "Error due to a conflict";
      case 408:
        return tempMessage ?? "Send timeout in connection with API server";
      case 500:
        return tempMessage ?? "Internal Server Error";
      case 503:
        return tempMessage ?? "Service unavailable";
      default:
        var responseCode = statusCode;
        return "Received invalid status code: $responseCode";
    }
  }
}

class ExceptionWrapper implements Exception {
  final String message;

  ExceptionWrapper(this.message);

  @override
  String toString() => message;
}
