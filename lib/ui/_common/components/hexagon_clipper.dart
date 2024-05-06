import 'dart:math' as math;
import 'package:flutter/material.dart';

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double radius = size.width / 2;  // 반지름은 너비의 절반을 사용
    Offset center = Offset(size.width / 2, size.height / 2);
    double angle = math.pi / 3;

    // 첫 번째 꼭지점을 시작점으로 설정
    Offset startPoint = Offset(center.dx + radius * math.cos(0), center.dy + radius * math.sin(0));
    path.moveTo(startPoint.dx, startPoint.dy);

    // 육각형의 6개 꼭지점 생성
    for (int i = 1; i <= 6; i++) {
      double x = center.dx + radius * math.cos(angle * i);
      double y = center.dy + radius * math.sin(angle * i);
      path.lineTo(x, y);
    }
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
