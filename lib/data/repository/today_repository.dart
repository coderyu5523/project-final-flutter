import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/today/today_request.dart';
import 'package:project_app/data/dtos/user/user_response.dart';
import 'package:project_app/ui/main/today/viewmodel/today_page_viewmodel.dart';

import '../../_core/constants/http.dart';
import '../dtos/response_dto.dart';
import '../dtos/today/today_response.dart';

class TodayRepository {
  Future<ResponseDTO> fetchMainPage(String accessToken) async {
    final response = await dio.get("/api/users",
        options: Options(headers: {"Authorization": "${accessToken}"}));

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if(responseDTO.status == 200){
      List<dynamic> temp = responseDTO.body["bodyData"];
      List<BodyDataDTO> bodyDataList = temp.map((e) => BodyDataDTO.fromJson(e)).toList();
      MainDTO mainDTO = MainDTO.fromJson(responseDTO.body);
      TodayPageModel model = TodayPageModel(mainDTO: mainDTO, bodyDataList: bodyDataList);
      responseDTO.body = model;

    }
    return responseDTO;
  }

  Future<ResponseDTO> fetchUpdateBodyData(AddBodyDataRequestDTO requestDTO, String accessToken) async {
    final response = await dio.post("/api/body-date/save",
        options: Options(headers: {"Authorization": "${accessToken}"}),data: requestDTO.toJson());
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    print("test: ${responseDTO.status}");


    return responseDTO ;
  }
}
