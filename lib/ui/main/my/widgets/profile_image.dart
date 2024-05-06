import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage("assets/images/saram1.png"),
          fit: BoxFit.cover,
        ),
        border: Border.all(color: Colors.white, width: 4),
      ),
    );
  }
}