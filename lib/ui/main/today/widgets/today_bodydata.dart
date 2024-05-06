import 'package:flutter/material.dart';

import '../../../../_core/constants/size.dart';
import '../../../_common/components/composition_box2.dart';

class TodayBodydata extends StatelessWidget {
  const TodayBodydata({
    super.key,
    required this.toggleVisibility,
    required this.fatVisible,
    required this.muscleVisible,
    required this.weightVisible,
  });

  final Function(String) toggleVisibility;
  final bool fatVisible;
  final bool muscleVisible;
  final bool weightVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CompositionBox2(
            name: "체지방",
            titleColor: Colors.blueGrey,
            valueColor: fatVisible ? Colors.lightGreenAccent : Colors.grey,
            borderColor: fatVisible ? Colors.lightGreenAccent : Colors.grey,
            value: "14.2",
            onTap: () => toggleVisibility('fat'),
          ),
          SizedBox(width: gap_s),
          CompositionBox2(
            name: "골격근",
            titleColor: Colors.blueGrey,
            valueColor: muscleVisible ? Colors.tealAccent : Colors.grey,
            borderColor: muscleVisible ? Colors.tealAccent : Colors.grey,
            value: "35.6",
            onTap: () => toggleVisibility('muscle'),
          ),
          SizedBox(width: gap_s),
          CompositionBox2(
            name: "체중",
            titleColor: Colors.blueGrey,
            valueColor: weightVisible ? Colors.deepPurpleAccent : Colors.grey,
            borderColor: weightVisible ? Colors.deepPurpleAccent : Colors.grey,
            value: "76.7",
            onTap: () => toggleVisibility('weight'),
          ),
        ],
      ),
    );
  }
}
