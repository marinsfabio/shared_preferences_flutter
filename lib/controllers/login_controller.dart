import 'package:flutter/material.dart';
import 'package:shared_preferences_flutter/services/prefes_service.dart';

class LoginController {
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  String? _user;
  setUser(String value) => _user = value;

  String? _pass;
  setPass(String value) => _pass = value;

  Future<bool> auth() async {
    inLoader.value = true;
    await Future.delayed(const Duration(seconds: 2));
    inLoader.value = false;
    if (_user == 'admin' && _pass == '123') {
      PrefsService.save(_user!);
      return true;
    }
    return false;
  }
}
