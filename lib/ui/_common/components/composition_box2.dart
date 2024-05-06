import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/style.dart';

import '../../../_core/constants/size.dart';

class CompositionBox2 extends StatelessWidget {
  final Color titleColor;
  final Color valueColor;
  final Color borderColor;
  final Color backgroundColor;
  final String name;
  final String value;
  final VoidCallback onTap;

  CompositionBox2({
    this.titleColor = Colors.black,
    this.valueColor = Colors.black,
    this.borderColor = Colors.black,
    this.backgroundColor = Colors.white,
    required this.name,
    this.value = "-",
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(gap_m),
            border: Border.all(color: borderColor),
            boxShadow: [
              BoxShadow(
                color: Colors.transparent.withOpacity(0.2),
                blurRadius: 5,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(gap_sm),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: subtitle1(mColor: titleColor),
                ),
                Text(
                  value + "kg",
                  style: h6(mColor: valueColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
