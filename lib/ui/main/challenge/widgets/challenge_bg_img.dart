import 'package:flutter/material.dart';

class ChallengeBgImg extends StatelessWidget {
  final String imagePath;

  const ChallengeBgImg({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      height: 250.0,
      fit: BoxFit.cover,
    );
  }
}

