import 'package:project_app/data/dtos/user/user_request.dart';
import 'package:project_app/data/repository/user_repositiry.dart';

void main() async {}

Future<void> login() async {
  LoginRequestDTO loginRequestDTO = LoginRequestDTO("ssar", "1234");

  var (responseDTO, accessToken) =
      await UserRepository().fetchLogin(loginRequestDTO);
}
