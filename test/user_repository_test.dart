import 'package:project_app/data/dtos/user/user_request.dart';
import 'package:project_app/data/repository/user_repositiry.dart';

void main() async {
  await userUpdateForm_test();
}

Future<void> login() async {
  LoginRequestDTO loginRequestDTO = LoginRequestDTO("ssar", "1234");

  var (responseDTO, accessToken) =
      await UserRepository().fetchLogin(loginRequestDTO);
}

Future<void> userUpdateForm_test() async {
  print('???');
  var a = await UserRepository().fetchUserUpdateForm("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtZXRhY29kaW5nIiwiaWQiOjEsImV4cCI6MTcxNDk3NjYwMCwidXNlcm5hbWUiOiJzc2FyIn0.CATsx0k3HOb2hvpo0BongiLP4uMwgeX7-oWOlLHdMTpgVXMG8bon__pct9SQ4Jw_jMQQvpV_hzFc5yyn2elgyw");
  print('???');
}
