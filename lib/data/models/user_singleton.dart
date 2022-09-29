import 'package:flutter/material.dart';

class UserSingleton with ChangeNotifier {
  static final UserSingleton _userSingleton = UserSingleton._internal();

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

  factory UserSingleton() {
    return _userSingleton;
  }

  UserSingleton._internal();
}
