import 'package:dio/dio.dart';

/// Helper class for converting [DioError] into readable formats
class ApiError {
  int? errorType = 0;
  ApiErrorModel? apiErrorModel;

  // final logger = getLogger('ApiError');

  /// description of error generated this is similar to convention [Error.message]
  String? errorDescription;

  ApiError({this.errorDescription});

  ApiError.fromDio(Object dioError) {
    _handleError(dioError);
  }

  /// sets value of class properties from [error]
  void _handleError(Object error) {
    if (error is DioException) {
      DioException dioError = error; // as DioError;
      // logger.d(dioError.response?.data);
      switch (dioError.type) {
        case DioExceptionType.cancel:
          errorDescription = "Request to server was cancelled";
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription =
              "Connection timeout with server, please try again later";
          break;
        case DioExceptionType.badCertificate:
          errorDescription = "Bad Certificate";
          break;
        case DioExceptionType.connectionError:
          errorDescription = "Connection Error, please try again later";
          break;
        case DioExceptionType.unknown:
          errorDescription =
              "Connection to server failed due to internet connection, please check and try again";
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription =
              "Receive timeout in connection with server, please try again later.";
          break;
        case DioExceptionType.badResponse:
          errorType = dioError.response?.statusCode;
          if (dioError.response?.statusCode == 401) {
            apiErrorModel = ApiErrorModel.fromJson(dioError.response!.data);
            print('errorrr..... ${apiErrorModel?.error}');
            print(dioError.response!.data);

            // if (dioError.response!.data.toString().isNotEmpty) {
            //   print(dioError.response!.data);
            // }
            errorDescription = apiErrorModel?.message ??
                apiErrorModel?.error ??
                extractDescriptionFromResponse(error.response);
          } else if (dioError.response?.statusCode == 400 ||
              dioError.response?.statusCode == 422 ||
              dioError.response?.statusCode == 403 ||
              dioError.response?.statusCode == 404 ||
              dioError.response?.statusCode == 409) {
            apiErrorModel = ApiErrorModel.fromJson(dioError.response?.data);
            if (dioError.response!.data.toString().isNotEmpty) {
              errorDescription = apiErrorModel?.message ??
                  apiErrorModel?.error ??
                  extractDescriptionFromResponse(error.response);
            }

            // if (apiErrorModel?.error != null) {
            //   if (apiErrorModel?.error['error'] != null) {
            //     errorDescription = apiErrorModel?.error['description'];
            //   } else if (apiErrorModel?.error['email'] != null) {
            //     errorDescription = apiErrorModel?.error['email'];
            //   } else if (apiErrorModel?.error['interest'] != null) {
            //     errorDescription = apiErrorModel?.error['interest'][0];
            //   } else if (apiErrorModel?.error['content'] != null) {
            //     errorDescription = apiErrorModel?.error['content']['error'];
            //   } else if (apiErrorModel?.error['business_logo'] != null) {
            //     errorDescription = apiErrorModel?.error['business_logo'][0];
            //   } else if (apiErrorModel?.error['description'] != null) {
            //     errorDescription = apiErrorModel?.error['description'][0];
            //   } else if (apiErrorModel?.error['referral_code'] != null) {
            //     errorDescription = apiErrorModel?.error['referral_code'][0];
            //   }
            // } else {
            //   errorDescription = apiErrorModel?.error ??
            //       extractDescriptionFromResponse(error.response);
            // }
          } else if (dioError.response?.statusCode == 500) {
            apiErrorModel = ApiErrorModel.fromJson(dioError.response?.data);
            print(dioError.response?.data);
            if (dioError.response!.data.toString().isNotEmpty) {
              errorDescription = apiErrorModel?.message ??
                  apiErrorModel?.error ??
                  extractDescriptionFromResponse(error.response);
            } else {
              errorDescription =
                  'Something went wrong while processing your request';
            }
          } else {
            errorDescription =
                "Oops! we couldn't make connections, please try again";
          }
          break;
        case DioExceptionType.sendTimeout:
          errorDescription =
              "Connection to server failed due to internet connection, please check and try again";
          break;
      }
    } else {
      errorDescription = "Oops an error occurred, we are fixing it";
    }
  }

  String extractDescriptionFromResponse(Response<dynamic>? response) {
    String message = "";
    try {
      if (response?.data != null && response?.data["message"] != null) {
        message =
            response?.data["message"] ?? response?.data['error']['email'][0];
      } else {
        message = response?.statusMessage ?? '';
      }
    } catch (error) {
      message = response?.statusMessage ?? error.toString();
    }
    return message;
  }

  @override
  String toString() => '$errorDescription';
}

class ApiErrorModel {
  String? code;
  String? message;
  bool? success;
  String? details;
  dynamic content;
  dynamic error;

  ApiErrorModel(
      {this.content,
      this.code,
      this.message,
      this.success,
      this.details,
      this.error});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
      code: json["code"],
      message: json["message"] ?? json["message"],
      success: json["success"],
      details: json["details"],
      error: json["error"],
      content: json["content"]);
}
