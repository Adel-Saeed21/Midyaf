import 'package:dio/dio.dart';
import 'package:hotelapp/feature/riverpod_test/networking/joke_api_const.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;
  static getDio() {
    Duration timout = const Duration(seconds: 30);
    //implement singleton design pattern
    if (dio == null) {
      dio = Dio();
      dio!.options.baseUrl = JokeApiConst.baseURL;
      dio!.options.connectTimeout = timout;
      dio!.options.receiveTimeout = timout;
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        responseHeader: true,
        requestHeader: true,
      ),
    );
  }
}
