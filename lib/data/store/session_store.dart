import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/_core/constants/move.dart';
import 'package:project_app/data/models/user.dart';
import 'package:project_app/main.dart';

class SessionUser {
  User? user;
  String? accessToken;
  bool isLogin = false;

  SessionUser();
}

class SessionStore extends SessionUser {
  final mContext = navigatorKey.currentContext;

  SessionStore();

  void loginCheck(String path) {
    if (isLogin) {
      Navigator.pushNamed(mContext!, path);
    } else {
      Navigator.pushNamed(mContext!, Move.loginPage);
    }
  }

// Future<void> join(JoinReqDTO joinReqDTO) async {
//   ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);
//
//   // 비지니스 로직
//   if (responseDTO.success) {
//     Navigator.pushNamed(mContext!, Move.loginPage);
//   } else {
//     ScaffoldMessenger.of(mContext!).showSnackBar(
//       SnackBar(content: Text("로그인 실패 : ${responseDTO.errorMessage}")),
//     );
//   }
// }

// Future<void> login(LoginRequestDTO loginReqDTO) async {
//   var (responseDTO, accessToken) =
//       await UserRepository().fetchLogin(loginReqDTO);
//
//   if (responseDTO.success) {
//     await secureStorage.write(key: "accessToken", value: accessToken);
//
//     this.user = responseDTO.response;
//     this.accessToken = accessToken;
//     this.isLogin = true;
//
//     Navigator.pushNamedAndRemoveUntil(
//         mContext!, Move.postListPage, (route) => false);
//   } else {
//     ScaffoldMessenger.of(mContext!).showSnackBar(
//         SnackBar(content: Text("로그인 실패 : ${responseDTO.errorMessage}")));
//   }
// }
}

// 창고 관리자
final sessionProvider = StateProvider<SessionStore>((ref) {
  return SessionStore();
});
