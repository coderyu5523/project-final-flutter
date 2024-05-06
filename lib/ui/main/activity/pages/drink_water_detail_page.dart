import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';

import '../widgets/WaterIntakeGraph.dart';

class DrinkWaterDetailPage extends StatefulWidget {
  @override
  _DrinkWaterDetailPageState createState() => _DrinkWaterDetailPageState();
}

class _DrinkWaterDetailPageState extends State<DrinkWaterDetailPage> {
  int currentIntake = 0; // 현재 섭취량
  final int glassSize = 250; // 한 잔의 크기
  final int totalIntake = 2000; // 총 목표 섭취량

  void _addDrink() {
    if (currentIntake < totalIntake) {
      setState(() {
        currentIntake += glassSize;
      });
    }
  }

  void _removeDrink() {
    if (currentIntake > 0) {
      setState(() {
        currentIntake -= glassSize;
      });
    }
  }

  Widget _buildProgressIndicator() {
    return Stack(
      children: <Widget>[
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        FractionallySizedBox(
          widthFactor: currentIntake >= totalIntake ? 1.0 : currentIntake /
              totalIntake,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightBlueAccent, kAccentColor2!],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('0', style: TextStyle(color: Colors.white)),
                Text(
                    '$currentIntake ml', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCupIcons() {
    List<Widget> cups = [];
    for (int i = 0; i < totalIntake / glassSize; i++) {
      String cupImagePath = (i * glassSize < currentIntake)
          ? 'assets/images/water2.png'
          : 'assets/images/greywater.png';
      cups.add(
        Image.asset(cupImagePath, width: 40),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: cups,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('물 마시기'),
        backgroundColor: TColor.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            WaterIntakeGraph(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '오늘 물을 $currentIntake ml 마셨어요',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '수분 충전하세요!',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  _buildProgressIndicator(), // 프로그레스바
                  SizedBox(height: 20),
                  _buildCupIcons(), // 컵 아이콘 표시
                  SizedBox(height: 20),
                  Text(
                    '부족        좋아요        거의다왔어요        완벽해요',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/water2.png', width: 120),
                      Positioned(
                        bottom: 0,
                        child: Text(
                          '250ml',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.remove, color: kAccentColor2),
                            onPressed: _removeDrink,
                          ),
                          SizedBox(width: 120),
                          IconButton(
                            icon: Icon(Icons.add, color: kAccentColor2),
                            onPressed: _addDrink,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}