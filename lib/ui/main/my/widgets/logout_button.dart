import 'package:flutter/material.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';
import '../../../../_core/constants/move.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, Move.loginPage);
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 1, top: 1, left: gap_s, right: gap_s),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.all(Radius.circular(gap_s)),
        ),
        child: Text("로그아웃", style: subtitle2()),
      ),
    );
  }
}
