import 'dart:convert';

UserLoginRequestDto userLoginRequestDtoFromJson(String str) =>
    UserLoginRequestDto.fromJson(json.decode(str));

String userLoginRequestDtoToJson(UserLoginRequestDto data) =>
    json.encode(data.toJson());

class UserLoginRequestDto {
  UserLoginRequestDto({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  factory UserLoginRequestDto.fromJson(Map<String, dynamic> json) =>
      UserLoginRequestDto(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
