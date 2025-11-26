import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hotelapp/core/networking/network_service.dart';
import 'package:hotelapp/feature/auth/signup_screen/data/repo_imp/signup_repo_imp.dart';
import 'package:hotelapp/feature/auth/signup_screen/domain/usecases/signup_usecase.dart';
import 'signup_notifier.dart';
import 'signup_state.dart';

/// NetworkService Provider
final networkServiceProvider = Provider<NetworkService>((ref) {
  return NetworkServiceImp();
});

/// Repo Provider
final signupRepoProvider = Provider<SignupRepoImp>((ref) {
  return SignupRepoImp(networkService: ref.read(networkServiceProvider));
});

/// UseCase Provider
final signupUseCaseProvider = Provider<SignUpUseCase>((ref) {
  return SignUpUseCase(ref.read(signupRepoProvider));
});

/// StateNotifier Provider (main one)
final signupNotifierProvider =
    StateNotifierProvider<SignupNotifier, SignupState>((ref) {
  return SignupNotifier(ref.read(signupUseCaseProvider));
});
