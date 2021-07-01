import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProvider extends StateNotifier<AsyncValue<User>> {
  UserProvider()
      : super(AsyncData(User(id: 0, username: "None", status: "Inactive")));
  late User user;
}

class User {
  String username;
  String? fullName;
  String? email;
  String? avatar;
  int id;
  String status;

  User(
      {required this.username,
      this.fullName,
      this.email,
      this.avatar,
      required this.id,
      required this.status});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'] ?? "None",
      fullName: json['full_name'],
      email: json['email'],
      avatar: json['avatar'],
      id: json['id'] ?? 0,
      status: json['status'] ?? "Inactive",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['id'] = this.id;
    data['status'] = this.status;
    return data;
  }
}
