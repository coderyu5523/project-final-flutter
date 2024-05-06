import 'package:flutter/material.dart';

// 청록색
const kAccentColor1 = Color(0xFF009688);
// 진한 녹색
const kAccentColor2 = Color(0xff296e48);
// 물 색
const kAccentColor3 = Color(0xFFFFFDE7);


class TColor {
  static Color get primaryColor1 => const Color(0xFF69F0AE);
  static Color get primaryColor2 => const Color(0xFF1DE9B6);

  static Color get secondaryColor1 => const Color(0xFF33691E);
  static Color get secondaryColor2 => const Color(0xFF69F0AE);
  static Color get secondaryColor3 => const Color(0xFFFF9800);
  static Color get secondaryColor4 => const Color(0xffF7F8F8);



  static List<Color> get primaryG => [ primaryColor2, primaryColor1 ];
  static List<Color> get secondaryG => [ secondaryColor2, secondaryColor1 ];
  static List<Color> get thirdG => [ secondaryColor3, secondaryColor4 ];

  static Color get black => const Color(0xff1D1617);
  static Color get darkGrey => const Color(0x8A000000);
  static Color get grey => const Color(0xff786F72);
  static Color get white => Colors.white;
  static Color get lightGrey => const Color(0xffF7F8F8);

}