import 'package:hotelapp/core/networking/api_result.dart';
import 'package:hotelapp/feature/auth/login_screen/data/model/login_request.dart';

abstract class LoginRepo {
  Future<ApiResult<void>> login(LoginRequest login);
}
