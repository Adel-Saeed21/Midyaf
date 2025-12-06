import 'package:hotelapp/core/networking/api_const.dart';
import 'package:hotelapp/core/networking/api_result.dart';
import 'package:hotelapp/core/networking/network_service.dart';
import 'package:hotelapp/feature/auth/login_screen/data/model/login_request.dart';
import 'package:hotelapp/feature/auth/login_screen/domain/repos/login_repo.dart';

class LoginRepoImp extends LoginRepo {
  final NetworkService networkService;

  LoginRepoImp({required this.networkService});
  @override
  Future<ApiResult<void>> login(LoginRequest login) async {
    final response = await networkService.post(ApiConst.login, {
      'username': login.email,
      'password': login.password,
      'rememberMe': login.rememberMe,
    });
    if (response.statusCode == 200) {
      return ApiResult.success(null);
    } else {
      return ApiResult.error(
        'Failed to login. Status code: ${response.statusCode}',
      );
    }
  }
}
