import 'package:hotelapp/core/networking/api_const.dart';
import 'package:hotelapp/core/networking/api_error_handler.dart';
import 'package:hotelapp/core/networking/network_service.dart';
import 'package:hotelapp/feature/auth/register/data/models/register_request_body.dart';

abstract class RemoteDataSource {
  Future<bool> register(RegisterRequestBody registerRequestBody);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final NetworkService networkService;

  RemoteDataSourceImpl(this.networkService);

  @override
  Future<bool> register(RegisterRequestBody registerRequestBody) async {
    try {
      final response = await networkService.post(
        ApiConst.register,
        registerRequestBody.toJson(),
      );

      return response.data['isSuccess'] ?? false;
    } catch (e) {
      throw ApiErrorHandler.handle(e);
    }
  }
}
