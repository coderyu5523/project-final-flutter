import 'package:flutter/material.dart';
import '../widgets/buffer_progress_widget.dart';

class StepCountProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Text(
            '목표의 40%를 달성했어요!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        BufferProgressWidget(goalSteps: 10000, currentSteps: 5000),
      ],
    );
  }
}

