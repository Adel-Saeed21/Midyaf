import 'package:dio/dio.dart';
import 'package:hotelapp/feature/riverpod_test/networking/dio_factory.dart';

abstract class NetworkService {
  Future<Response> get(String url);
  Future<Response> post(String url, dynamic body);
}

class NetworkServiceImp extends NetworkService {
  final dio = DioFactory.getDio();
  @override
  Future<Response> get(String url) async {
    try {
      final response = await dio.get(url);

      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Response> post(String url, dynamic body) async {
    try {
      final response = await dio.post(
        url,
        data: body,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
