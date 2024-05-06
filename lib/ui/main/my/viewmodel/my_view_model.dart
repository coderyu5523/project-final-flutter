import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/dtos/user/user_request.dart';
import 'package:project_app/data/models/user.dart';
import 'package:project_app/data/repository/user_repositiry.dart';
import 'package:project_app/data/store/session_store.dart';
import 'package:project_app/main.dart';

class UserUpdateModel {
  User user;

  UserUpdateModel(this.user);
}

class UserUpdateViewModel extends StateNotifier<UserUpdateModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  UserUpdateViewModel(super._state, this.ref);

  Future<void> notifyInit() async {

    SessionStore sessionStore = ref.read(sessionProvider);
    print(sessionStore.accessToken.toString());

    ResponseDTO responseDTO =
        await UserRepository().fetchUserUpdateForm(sessionStore.accessToken!);

    state = UserUpdateModel(responseDTO.body);
  }
}

final userUpdateProvider =
StateNotifierProvider<UserUpdateViewModel, UserUpdateModel?>((ref) {
  return UserUpdateViewModel(null, ref)..notifyInit();
});
