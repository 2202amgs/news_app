import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(url, queryParameters: query);
  }
}

//e5d184a293ef476bb2c1b7ccfb436a72
//e43299d7366e4f0aac3d65bb4253a1e6
//https://newsapi.org/v2/everything?q=Apple&from=2021-12-15&sortBy=popularity&apiKey=API_KEY