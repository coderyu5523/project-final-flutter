import 'package:flutter/material.dart';

import '../../ui/main/today/today_page.dart';
import '../../ui/main_page.dart';
import '../../ui/welcome/join_page/join_page.dart';
import '../../ui/welcome/login_page/login_page.dart';
import '../../ui/welcome/welcome_page/welcome_page.dart';

class Move {
  static String welcomePage = "/welcome";
  static String loginPage = "/login";
  static String joinPage = "/join";
  static String mainPage = "/main";
  static String todayPage = "/today"; // 주소는 아직 미확정
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.welcomePage: (context) => const WelcomePage(),
    Move.loginPage: (context) => const LoginPage(),
    Move.joinPage: (context) => JoinPage(),
    Move.mainPage: (context) => const MainPage(),
    Move.todayPage: (context) => const TodayPage(),
  };
}
