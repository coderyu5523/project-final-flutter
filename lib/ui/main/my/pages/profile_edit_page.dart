import 'package:flutter/material.dart';

import '../widgets/edit_button.dart';
import '../widgets/edit_height.dart';
import '../widgets/edit_image.dart';
import '../widgets/edit_name.dart';
import '../widgets/edit_password.dart';
import '../widgets/edit_phone.dart';
import '../widgets/edit_profile_form.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          EditProfileForm(),
        ],
      ),
    );
  }
}