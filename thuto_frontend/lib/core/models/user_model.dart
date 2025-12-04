import 'dart:core';
import 'dart:convert'; //Converts models from model to json

UserModel userModelJson(String str) => 
  UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson);

class UserModel {
  int id;
  String email;
  String password;

  UserModel({
    required this.id,
    required this.email,
    required this.password
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"], 
    email: json["email"], 
    password: json["password"]
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "id": id,
  };

  String  get EmailGet => email;
  String get PasswordGet => password;
}