import 'dart:convert';

import 'package:clean_arch_expert/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String name,
    required DateTime bornDate,
    required String pictureUrl,
    required String email,
  }) : super(
            name: name,
            bornDate: bornDate,
            pictureUrl: pictureUrl,
            email: email);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'bornDate': bornDate.millisecondsSinceEpoch,
      'pictureUrl': pictureUrl,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      bornDate: DateTime.parse(map['bornDate']),
      pictureUrl: map['pictureUrl'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
