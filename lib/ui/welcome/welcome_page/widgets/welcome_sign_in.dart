import 'package:flutter/material.dart';
import 'package:project_app/ui/welcome/welcome_page/widgets/welcome_navigator_button.dart';

import '../../../../../_core/constants/move.dart';

class WelcomeSignIn extends StatelessWidget {
  const WelcomeSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // 로그인
      child: WelcomeNavigatorButton(
        buttonText: 'Sign in',
        routeName: Move.loginPage,
        // onTap: LoginPage(),
        color: Colors.teal,
        textColor: Colors.white,
      ),
    );
  }
}
