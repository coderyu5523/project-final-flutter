import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/ui/main/my/viewmodel/my_view_model.dart';

import '../widgets/edit_image.dart';
import '../widgets/edit_profile_form.dart';

class ProfileEditPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserUpdateModel? userUpdateModel = ref.watch(userUpdateProvider);
    if(userUpdateModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("프로필 수정"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView(
          children: [
            EditImage(),
            EditProfileForm(userUpdateModel.user),
          ],
        ),
      );
    }
  }
}