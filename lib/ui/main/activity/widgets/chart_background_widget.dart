import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';

class ChartBackgroundWidget extends StatelessWidget {
  final List<Map<String, dynamic>> milestones;
  final int currentSteps;

  ChartBackgroundWidget({required this.milestones, required this.currentSteps});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: milestones.map((milestone) {
          return _buildStepMilestone(context, milestone['label'], milestone['step']);
        }).toList(),
      ),
    );
  }

  Widget _buildStepMilestone(BuildContext context, String text, int milestone) {
    bool achieved = currentSteps >= milestone;
    Color bgColor = achieved ? kAccentColor2 : Colors.white;
    Color textColor = achieved ? Colors.white : Colors.grey.shade600;
    IconData iconData = achieved ? Icons.check_circle : Icons.remove_circle_outline;

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(iconData, color: achieved ? Colors.white : Colors.black26),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
