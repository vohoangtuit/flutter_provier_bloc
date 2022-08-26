import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/base/loading_view.dart';
import 'package:flutter_provider/bloc/base_bloc.dart';
import 'package:flutter_provider/network/api_provider.dart';
import 'package:flutter_provider/shared_preferences/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NetworkConfig {
  final String baseUrl = 'http://mobile.vietravel.com/api/';

  //final String baseUrl = 'http://108.108.110.22:9999//api/';
  //final String baseUrl = "http://108.108.110.22:8080/api/";//http://101.53.10.57:8080/
  final String apiKey = '973e0b034af17e62d03ca343795ac965';
  final String kLanguageDefault = 'vn';
  final String kTypeDefault = '2'; //1: android; 2: iOS
  String kDeviceCodeDefault = ''; //1: android; 2: iOS
  late ApiProvider restApi;
  final SharedPreferences sharedPreferences;
  Options cacheOptions = buildCacheOptions(const Duration(days: 3),
      maxStale: const Duration(days: 7), forceRefresh: true);

  String? token = '';

  NetworkConfig.internal({required this.sharedPreferences}) {
   //print('NetworkConfig');
    DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
    Dio dio = Dio();
    dio.options.baseUrl = baseUrl;
    //   _dio!.options.receiveTimeout = 3000;
    dio.interceptors.add(AppInterceptors(sharedPreferences: sharedPreferences));
    dio.interceptors.add(dioCacheManager.interceptor);
    if (kDebugMode) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
    restApi = ApiProvider(dio, baseUrl: baseUrl);
  }

  // NetworkConfig() {
  //   var dio = Dio();
  //   Map<String, dynamic> requestHeaders = {
  //     'Content-type': 'application/json',
  //     'Accept': 'application/json',
  //     //'Authorization': '$token',
  //     'Language': 'vi'
  //   };
  //   dio.options = BaseOptions(
  //     // receiveTimeout: 7000,
  //     // connectTimeout: 7000,
  //     contentType: 'application/json',
  //    //  headers: requestHeaders,
  //
  //   );
  //   if (kDebugMode) {
  //     dio.interceptors.add(LogInterceptor(requestBody: true,responseBody: true));
  //   }
  //   restApi =ApiProvider(dio, baseUrl: baseUrl);
  //   //restApi =ApiProvider(dio,token!, baseUrl: baseUrl);
  // }


}

class AppInterceptors extends InterceptorsWrapper {
  final SharedPreferences sharedPreferences;

  AppInterceptors({required this.sharedPreferences});
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {

    String token =sharedPreferences.getString(SharedPre.sharedPreID)??"";
    // print('token $token');

    Map<String, dynamic> requestHeaders = {
      'contentType': 'application/json', // todo contentType is Error booking
      'Authorization': token,
      'Language': 'vi',
      'Connection': 'keep-alive'
    };
    options.headers = requestHeaders;
    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    // print('response ${response.data.toString()}');
    return super.onResponse(response, handler);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) {
    // var url = err.request.uri;
    print("************************************************");
    print(err);
    super.onError(err, handler);
  }
  Future<String?> _getToken()async{
    return  sharedPreferences.getString(SharedPre.sharedPreID)??"";
  }
}
