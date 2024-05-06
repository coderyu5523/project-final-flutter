import 'package:flutter/material.dart';

class EditName extends StatelessWidget {
  const EditName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:30,right: 30,top: 20),
      child: TextFormField(
        decoration: InputDecoration(
          label: const Text('이름'),
          hintText: '이름을 입력하세요',
          hintStyle: const TextStyle(color: Colors.black26),
          border: const UnderlineInputBorder(),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
    ;
  }
}
