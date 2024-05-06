import 'package:flutter/material.dart';

class EditPassword extends StatelessWidget {
  const EditPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
      child: Column(
        children: [
          TextFormField(
            obscureText: true, // 비밀번호를 숨겨서 보여줍니다
            decoration: InputDecoration(
              label: const Text('비밀번호'),
              hintText: '비밀번호를 입력하세요',
              hintStyle: const TextStyle(color: Colors.black26),
              border: const UnderlineInputBorder(),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(height: 20), // 두 입력 필드 사이의 공간을 추가합니다
          TextFormField(
            obscureText: true, // 비밀번호를 숨겨서 보여줍니다
            decoration: InputDecoration(
              label: const Text('비밀번호 확인'),
              hintText: '비밀번호를 다시 입력하세요',
              hintStyle: const TextStyle(color: Colors.black26),
              border: const UnderlineInputBorder(),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),          ),
          ),
        ],
      ),
    );
  }
}