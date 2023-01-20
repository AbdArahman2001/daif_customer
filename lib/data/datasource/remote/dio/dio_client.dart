import 'dart:io';
import 'package:dio/src/response.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../utill/app_constants.dart';
import 'logging_interceptor.dart';

class DioClient {
  final String baseUrl;
  final LoggingInterceptor loggingInterceptor;
  final SharedPreferences prefs;
  final Dio dio;
    String? countryCode;
  late String? token;

  DioClient(
       this.baseUrl,
      {required this.loggingInterceptor,
      required this.dio,
       this.countryCode,
      required this.prefs}) {
    token = prefs.getString(AppConstants.TOKEN);
    countryCode = prefs.getString(AppConstants.COUNTRY_CODE) ??
        AppConstants.languages[0].countryCode;
    dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 30000
      ..options.receiveTimeout = 30000
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
        AppConstants.LANG_KEY:
            countryCode == 'US' ? 'en' : countryCode!.toLowerCase(),
      };
    dio.interceptors.add(loggingInterceptor);
  }

  void updateHeader({String? token, String? countryCode}) {
    if(token !=null){
      this.token = token;
    }
    countryCode = countryCode == null
        ? this.countryCode == 'US'
            ? 'en'
            : this.countryCode!.toLowerCase()
        : countryCode == 'US'
            ? 'en'
            : countryCode.toLowerCase();
    this.countryCode = countryCode;
    dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${this.token}',
      AppConstants.LANG_KEY:
          countryCode == 'US' ? 'en' : countryCode.toLowerCase(),
    };
  }

  Future<Response> get(
    String uri, {
    required Map<String, dynamic> queryParameters,
        required Options options,
        required CancelToken cancelToken,
        required  ProgressCallback onReceiveProgress,
  }) async {
    try {
      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String uri, {
        required data,
        required Map<String, dynamic> queryParameters,
        required Options options,
        required CancelToken cancelToken,
        required ProgressCallback onSendProgress,
        required ProgressCallback onReceiveProgress,
  }) async {
    try {
      var response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String uri, {
        required data,
   required Map<String, dynamic> queryParameters,
        required Options options,
        required CancelToken cancelToken,
        required ProgressCallback onSendProgress,
        required ProgressCallback onReceiveProgress,
  }) async {
    try {
      var response = await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
        required data,
        required  Map<String, dynamic> queryParameters,
        required Options options,
        required CancelToken cancelToken,
  }) async {
    try {
      var response = await dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
