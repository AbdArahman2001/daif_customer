import 'package:dio/dio.dart';

class ApiResponse {
  final Response? response;
  final dynamic error;

  ApiResponse({required this.response,required this.error});

  ApiResponse.withError(dynamic errorValue)
      : response = null,
        error = errorValue;

  ApiResponse.withSuccess(Response responseValue)
      : response = responseValue,
        error = null;
}
