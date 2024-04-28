import 'package:flutter/material.dart';

import '../pages/join_page.dart';

class LoginSignUpSection extends StatelessWidget {
  const LoginSignUpSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const JoinPage()),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('계정이 없으신가요? ', style: TextStyle(color: Colors.black45)),
          Text('회원가입하기',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal)),
        ],
      ),
    );
  }
}
