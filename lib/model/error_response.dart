import 'dart:convert';

ErrorResp errorRespFromJson(String str) => ErrorResp.fromJson(json.decode(str));

ErrorResp errorRespFromJson2(String str) =>
    ErrorResp.fromJson2(json.decode(str));

String errorRespToJson(ErrorResp data) => json.encode(data.toJson());

class ErrorResp {
  String error;

  ErrorResp({
    required this.error,
  });

  factory ErrorResp.fromJson(Map<String, dynamic> json) => ErrorResp(
        error: json["data"],
      );

  factory ErrorResp.fromJson2(Map<String, dynamic> json) => ErrorResp(
        error: json["data"][0]['msg'],
      );

  Map<String, dynamic> toJson() => {
        "msg": error,
      };
}
