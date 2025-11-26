import 'package:json_annotation/json_annotation.dart';

part 'signup_request_model.g.dart';

@JsonSerializable()
class SignupRequestModel {
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String phoneNumber;
  final String country;
  final String city;
  final String address;
  final String password;
  final String confirmPassword;

  SignupRequestModel({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.country,
    required this.city,
    required this.address,
    required this.password,
    required this.confirmPassword,
  });

  factory SignupRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestModelToJson(this);
}
