import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/line.dart';
import 'package:project_app/_core/constants/size.dart';
import 'package:project_app/ui/main/my/widgets/company_info.dart';
import 'package:project_app/ui/main/my/widgets/contact_icons.dart';
import 'package:project_app/ui/main/my/widgets/logout_button.dart';
import 'package:project_app/ui/main/my/widgets/my_history.dart';
import 'package:project_app/ui/main/my/widgets/my_profile.dart';
import 'package:project_app/ui/main/my/widgets/my_status.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MyProfile(),
        MyStatus(),
        line2,
        MyHistory(),
        SizedBox(height: gap_l),
        line2,
        CompanyInfo(),
        ContactIcons(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LogoutButton(),
          ],
        ),
      ],
    );
  }
}