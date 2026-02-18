import 'package:hotelapp/core/networking/api_result.dart';
import 'package:hotelapp/feature/auth/login/data/models/login_request_body.dart';

abstract class LoginRepo {
  Future<ApiResult<void>> login(LoginRequestBody loginRequest);
}
