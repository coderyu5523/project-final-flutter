import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/dtos/activity/activity_response.dart';
import '../../../../main.dart';

class FoodUpdateModel {
  List<FoodNameListDTO> foodNameListDTO;
  List<FoodContentListDTO> foodContentListDTO;

  FoodUpdateModel(this.foodNameListDTO, this.foodContentListDTO);
}

class FoodUpdateViewModel extends StateNotifier<FoodUpdateModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  FoodUpdateViewModel(super.state, this.ref);

  Future<void> notifyInit() async {



  }
}



  final FoodUpdateProvider =
      StateNotifierProvider<FoodUpdateViewModel, FoodUpdateModel?>(
    (ref) {
      return FoodUpdateViewModel(null, ref)..notifyInit();
    },);

