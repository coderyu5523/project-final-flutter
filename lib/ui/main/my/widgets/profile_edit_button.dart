import 'package:flutter/material.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';
import '../pages/profile_edit_page.dart';

class ProfileEditButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(gap_s),
      onTap: () {
        // 프로필 수정 기능 구현
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileEditPage()),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: gap_s, vertical: 1),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(gap_s),
        ),
        child: Text("편집하기", style: subtitle2()),
      ),
    );
  }
}