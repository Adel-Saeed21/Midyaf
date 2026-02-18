import 'package:hotelapp/core/networking/api_result.dart';
import 'package:hotelapp/feature/auth/login/data/models/login_request_body.dart';
import 'package:hotelapp/feature/auth/login/domain/repo/login_repo.dart';

class LoginUseCase {
  final LoginRepo loginRepo;

  LoginUseCase({required this.loginRepo});

  Future<ApiResult<void>> call(LoginRequestBody loginRequest) async {
    return await loginRepo.login(loginRequest);
  }
}

