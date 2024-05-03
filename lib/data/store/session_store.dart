import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/_core/constants/http.dart';
import 'package:project_app/_core/constants/move.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/dtos/user/user_request.dart';
import 'package:project_app/data/repository/user_repositiry.dart';
import 'package:project_app/main.dart';

import '../models/user.dart';

class SessionUser {
  User? user;
  String? accessToken;
  bool? isLogin = false;

  SessionUser();
}

// 창고
class SessionStore extends SessionUser {
  Future<void> join(JoinRequestDTO joinRequestDTO) async {
    final mContext = navigatorKey.currentContext;
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinRequestDTO);

    if (responseDTO.status == 200) {
      Navigator.pushNamed(mContext!, Move.loginPage);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("회원가입 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> login(LoginRequestDTO requestDTO) async {
    final mContext = navigatorKey.currentContext;

    var (responseDTO, accessToken) =
        await UserRepository().fetchLogin(requestDTO);

    print("requestDTO : ${responseDTO.body}");

    if (responseDTO.status == 200) {
      await secureStorage.write(key: "accessToken", value: accessToken);
      this.user = responseDTO.body;
      this.accessToken = accessToken;
      this.isLogin = true;

      // Navigator.pushNamed(mContext!, Move.mainPage);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text("로그인 실패 : ${responseDTO.msg}")));
    }
  }

  SessionStore();
}

// 창고 관리자
final sessionProvider = StateProvider<SessionStore>((ref) {
  return SessionStore();
});
