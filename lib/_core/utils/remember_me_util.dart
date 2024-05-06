import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberMeUtil {
  static const String _rememberMeKey = 'rememberMe';

  static Future<void> setRememberMe(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_rememberMeKey, value);
  }

  static Future<bool> getRememberMe() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_rememberMeKey) ?? false;
  }
}
