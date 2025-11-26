import 'package:dio/dio.dart';
import 'package:hotelapp/feature/riverpod_test/model/joke_model.dart';
import 'package:hotelapp/feature/riverpod_test/networking/dio_factory.dart';

class JokeApiService {
  final Dio? _dio = DioFactory.getDio();

  Future<JokeModel> getJoke() async {
    try {
      final response = await _dio?.get('/random');

      if (response != null && response.statusCode == 200) {
        return JokeModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load joke: ${response?.statusCode}');
      }
    } on Exception catch (e) {
      throw Exception('Network error: ${e.toString()}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
