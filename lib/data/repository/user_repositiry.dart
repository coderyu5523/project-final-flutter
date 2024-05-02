import 'package:project_app/_core/constants/http.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/dtos/user/user_request.dart';
import 'package:project_app/data/models/user.dart';

class UserRepository {
  // Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
  //   final response = await dio.post("/join", data: requestDTO.toJson());
  //
  //   ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  //
  //   return responseDTO;
  // }

  Future<(ResponseDTO, String)> fetchLogin(LoginRequestDTO loginReqDTO) async {
    final response = await dio.post("/login", data: loginReqDTO.toJson());
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      responseDTO.body = User.fromJson(responseDTO.body);
      final accessToken = response.headers["Authorization"]!.first;

      return (responseDTO, accessToken);
    } else {
      throw new Exception("${responseDTO.msg}");
    }
  }
}
