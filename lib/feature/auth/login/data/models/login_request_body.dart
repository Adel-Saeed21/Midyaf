class LoginRequestBody {
  final String email;
  final String password;
  final bool? rememberMe;

  LoginRequestBody({
    required this.email,
    required this.password,
    this.rememberMe = false,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "rememberMe": rememberMe,
    };
  }

  factory LoginRequestBody.fromJson(Map<String, dynamic> json) {
    return LoginRequestBody(
      email: json['email'] as String,
      password: json['password'] as String,
      rememberMe: json['rememberMe'] as bool? ?? false,
    );
  }
}
