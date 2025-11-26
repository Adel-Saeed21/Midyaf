import 'package:hotelapp/core/networking/api_result.dart';
import 'package:hotelapp/feature/auth/signup_screen/data/model/signup_request_model.dart';
import 'package:hotelapp/feature/auth/signup_screen/domain/repo/signup_repo.dart';

class SignUpUseCase {
  final SignupRepo repo;

  SignUpUseCase(this.repo);

  Future<ApiResult<void>> execute(SignupRequestModel model) async {
    return await repo.signUp(model);
  }
}
