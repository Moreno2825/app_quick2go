import 'dart:convert';

UserCreateRequestDto userCreateRequestDtoFromJson(String str) =>
    UserCreateRequestDto.fromJson(json.decode(str));

String userCreateRequestDtoToJson(UserCreateRequestDto data) =>
    json.encode(data.toJson());

class UserCreateRequestDto {
  UserCreateRequestDto({
    required this.name,
    required this.lastname,
    required this.email,
    required this.password,
  });

  final String name;
  final String lastname;
  final String email;
  final String password;

  factory UserCreateRequestDto.fromJson(Map<String, dynamic> json) =>
      UserCreateRequestDto(
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "email": email,
        "password": password,
      };
}
