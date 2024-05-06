import 'package:flutter/material.dart';

class EditHeighte extends StatelessWidget {
  const EditHeighte({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:30,right: 30,top: 20),
      child: TextFormField(
        decoration: InputDecoration(
          label: const Text('키'),
          hintText: '키를 입력하세요',
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
