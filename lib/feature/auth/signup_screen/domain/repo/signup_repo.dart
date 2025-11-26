import 'package:hotelapp/core/networking/api_result.dart';
import 'package:hotelapp/feature/auth/signup_screen/data/model/signup_request_model.dart';

abstract class SignupRepo {
  Future<ApiResult<void>> signUp(SignupRequestModel model);
}
