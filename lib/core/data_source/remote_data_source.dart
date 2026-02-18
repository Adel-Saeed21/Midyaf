import 'package:hotelapp/core/networking/api_const.dart';
import 'package:hotelapp/core/networking/api_error_handler.dart';
import 'package:hotelapp/core/networking/network_service.dart';
import 'package:hotelapp/feature/auth/login/data/models/login_request_body.dart';
import 'package:hotelapp/feature/auth/login/data/models/login_response_body.dart';
import 'package:hotelapp/feature/auth/register/data/models/register_request_body.dart';

abstract class RemoteDataSource {
  Future<bool> register(RegisterRequestBody registerRequestBody);
  Future<LoginResponseBody> login(LoginRequestBody loginRequest);
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

  @override
  Future<LoginResponseBody> login(LoginRequestBody loginRequest) async {
    final response = await networkService.post(
      ApiConst.login,
      loginRequest.toJson(),
    );
    return LoginResponseBody.fromJson(response.data);
  }
}
