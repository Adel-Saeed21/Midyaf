import 'package:hotelapp/core/networking/api_const.dart';
import 'package:hotelapp/core/networking/api_result.dart';
import 'package:hotelapp/core/networking/network_service.dart';
import 'package:hotelapp/feature/auth/signup_screen/data/model/signup_request_model.dart';
import 'package:hotelapp/feature/auth/signup_screen/domain/repo/signup_repo.dart';

class SignupRepoImp extends SignupRepo {
  final NetworkService networkService;

  SignupRepoImp({required this.networkService});

  @override
  Future<ApiResult<void>> signUp(SignupRequestModel model) async {
    try {
      final response = await networkService.post(
        ApiConst.signup,
        model.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResult.success(null);
      } else {
        return ApiResult.error(
          Exception('Failed to sign up. Status code: ${response.statusCode}'),
        );
      }
    } catch (e) {
      return ApiResult.error(e);
    }
  }
}
