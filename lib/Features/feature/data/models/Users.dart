import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'Users.g.dart';

@JsonSerializable()
class User {
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;

  User({
    this.id,
    this.name,
    this.email,
    this.gender,
    this.status,
  });
}

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

///!  flutter pub run build_runner build
