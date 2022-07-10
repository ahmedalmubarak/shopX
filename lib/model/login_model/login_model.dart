import 'data.dart';

class LoginModel {
  bool? status;
  String? message;
  Data? data;

  LoginModel({this.status, this.message, this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
