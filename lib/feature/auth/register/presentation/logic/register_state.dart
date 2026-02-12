import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterError extends RegisterState {
  final String message;

  RegisterError(this.message);

  @override
  List<Object?> get props => [message];
}

class RegisterPasswordVisibilityChanged extends RegisterState {}

class RegisterCountryCodeChanged extends RegisterState {}

class RegisterUserTypeChanged extends RegisterState {}