//창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/dtos/user/user_response.dart';
import 'package:project_app/data/store/session_store.dart';
import 'package:project_app/main.dart';

import '../../../data/repository/today_repository.dart';

class TodayPageModel {
  MainDTO mainDTO;
  List<BodyDataDTO> bodyData;

  TodayPageModel({required this.mainDTO, required this.bodyData});
}

// 창고 창고

class TodayPageViewModel extends StateNotifier<TodayPageModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  TodayPageViewModel(super.state, this.ref);

  Future<void> notifyInit() async {
    print("2222222222");
    SessionStore sessionStore = ref.read(sessionProvider);

    print("3333333333333");
    ResponseDTO responseDTO = await TodayRepository().fetchMainPage(sessionStore.accessToken!);

    print("4444444444444");
    if (responseDTO.status == 200) {
      print("101010101010");
      // JSON 객체에서 MainDTO 인스턴스를 생성합니다.
      MainDTO mainDTO = MainDTO.fromJson(responseDTO.body);
      // MainDTO 인스턴스를 통해 bodyData 리스트를 직접 얻습니다.
      List<BodyDataDTO> bodyData = mainDTO.bodyData;
      TodayPageModel model = TodayPageModel(mainDTO: mainDTO, bodyData: bodyData);
      print(model.mainDTO);
      print("14141414141414");
      state = model;
    } else {
      print("1212121212");
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("불러오기 실패 : ${responseDTO.msg}")));
    }
  }
}

// 창고 관리자
final TodayPageProvider =
    StateNotifierProvider<TodayPageViewModel, TodayPageModel?>(
  (ref) {
    return TodayPageViewModel(null, ref)..notifyInit();
  },
);
