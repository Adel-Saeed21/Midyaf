import 'package:flutter_riverpod/legacy.dart';
import 'package:hotelapp/core/Di/get_it.dart';
import 'package:hotelapp/feature/auth/signup_screen/data/model/signup_request_model.dart';
import 'package:hotelapp/feature/auth/signup_screen/domain/usecases/signup_usecase.dart';
import 'signup_state.dart';

class SignupNotifier extends StateNotifier<SignupState> {
  final SignUpUseCase useCase = getIt<SignUpUseCase>();

  SignupNotifier() : super(const SignupState.initial());

  Future<void> signup(SignupRequestModel model) async {
    state = const SignupState.loading();

    final result = await useCase.execute(model);

    result.when(
      onSuccess: (_) => state = const SignupState.success(),
      onError: (e) => state = SignupState.error(e.toString()),
    );
  }



}
