import 'package:dio/dio.dart';

class DioNetwork {
  static Dio? dio;

  static defineDio() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://reqres.in/',

          receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> dioGetData(
      {String? url,dynamic data, Map<String, dynamic>? queryParameters}) async {
    return await dio!.get(url!,data: data, queryParameters: queryParameters);
  }


  }

