import 'package:hotelapp/core/data_source/remote_data_source.dart';
import 'package:hotelapp/feature/auth/register/data/models/register_request_body.dart';
import 'package:hotelapp/feature/auth/register/domain/repo/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final RemoteDataSource remoteDataSource;

  RegisterRepoImpl(this.remoteDataSource);

  @override
  Future<void> register(RegisterRequestBody registerRequestBody) async {
    final isSuccess = await remoteDataSource.register(registerRequestBody);

    if (!isSuccess) {
      throw Exception('Registration failed');
    }
  }
}
