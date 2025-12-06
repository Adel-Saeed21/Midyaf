import 'package:get_it/get_it.dart';
import 'package:hotelapp/core/networking/network_service.dart';
import 'package:hotelapp/feature/auth/signup_screen/data/repo_imp/signup_repo_imp.dart';
import 'package:hotelapp/feature/auth/signup_screen/domain/usecases/signup_usecase.dart';

final getIt = GetIt.instance;

void setupDi() {
  // Network Service
  getIt.registerLazySingleton<NetworkService>(() => NetworkServiceImp());

  // Repo
  getIt.registerLazySingleton<SignupRepoImp>(
      () => SignupRepoImp(networkService: getIt<NetworkService>()));

  // Usecase
  getIt.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(getIt<SignupRepoImp>()));
}