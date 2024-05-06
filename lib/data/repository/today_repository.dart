import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../_core/constants/http.dart';
import '../dtos/response_dto.dart';

class TodayRepository {
  Future<ResponseDTO> fetchMainPage(String accessToken) async {
    print("666666666666");
    final response = await dio.get("/api/users",
        options: Options(headers: {"Authorization": "${accessToken}"}));

    print("777777777777");
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    print("888888888");
    return responseDTO;
  }
}
