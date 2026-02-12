import 'package:hotelapp/feature/auth/register/data/models/register_request_body.dart';
import 'package:hotelapp/feature/auth/register/domain/repo/register_repo.dart';

class RegisterUseCase {
  final RegisterRepo registerRepo;

  RegisterUseCase({required this.registerRepo});

  Future<void> register(RegisterRequestBody registerRequestBody) async {
    await registerRepo.register(registerRequestBody);
  }
}