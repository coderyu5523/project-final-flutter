import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BufferProgressWidget extends StatelessWidget {
  final int goalSteps;
  final int currentSteps;

  BufferProgressWidget({
    required this.goalSteps,
    required this.currentSteps,
  });

  @override
  Widget build(BuildContext context) {
    double progress = currentSteps / goalSteps * 100;

    return Container(
      height: 250,
      width: 250,
      child: Stack(
        children: [
          SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                showLabels: false,
                showTicks: false,
                startAngle: 180,
                endAngle: 360,
                radiusFactor: 0.9,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.2,
                  color: const Color.fromARGB(30, 0, 169, 181),
                  thicknessUnit: GaugeSizeUnit.factor,
                  cornerStyle: CornerStyle.bothCurve,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                    value: progress,
                    width: 0.2,
                    sizeUnit: GaugeSizeUnit.factor,
                    color: const Color.fromARGB(120, 0, 169, 181),
                    enableAnimation: true,
                    animationDuration: 1500,
                    animationType: AnimationType.linear,
                    cornerStyle: CornerStyle.bothCurve,
                  ),
                ],
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$currentSteps',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  '/$goalSteps',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
