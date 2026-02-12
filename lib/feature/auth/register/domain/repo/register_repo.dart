import 'package:hotelapp/feature/auth/register/data/models/register_request_body.dart';

abstract class RegisterRepo {
  Future<void> register(RegisterRequestBody registerRequestBody);
}
