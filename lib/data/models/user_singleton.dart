import 'package:flutter/material.dart';

class User with ChangeNotifier {
  static final User _user = User._internal();

  String userId = '';
  String userEmail = '';

  void setId(userId) {
    this.userId = userId;
  }

  String getUserId() {
    return userId;
  }

  String getUserEmail() {
    return userEmail;
  }

  void setUserEmail(userEmail) {
    this.userEmail = userEmail;
  }

  factory User() {
    return _user;
  }

  User._internal();
}
