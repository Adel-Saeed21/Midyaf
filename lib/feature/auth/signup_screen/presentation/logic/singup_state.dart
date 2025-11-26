sealed class SingupState {}

final class SignupInitial extends SingupState {}

final class SignupLoading extends SingupState {}

final class SignupSuccess extends SingupState {}

final class SignupError extends SingupState {
  final String message;
  SignupError(this.message);
}
