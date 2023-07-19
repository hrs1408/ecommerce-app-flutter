import 'dart:convert';

LoginResponse loginRespFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginRespToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String accessToken;
  String tokenType;
  String expiresIn;
  String refreshToken;
  String refreshExpiresIn;

  LoginResponse({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.refreshToken,
    required this.refreshExpiresIn,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
      accessToken: json["data"]["access_token"],
      tokenType: json["data"]["token_type"],
      expiresIn: json["data"]["access_token_expires"],
      refreshToken: json["data"]["refresh_token"],
      refreshExpiresIn: json["data"]["refresh_token_expires"]);

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "refresh_token": refreshToken,
        "refresh_token_expires": refreshExpiresIn,
      };
}
