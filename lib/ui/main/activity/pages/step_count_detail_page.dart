import 'package:flutter/material.dart';

import '../../../../_core/constants/constants.dart';
import '../widgets/step_count_body.dart';

class StepCountDetailPage extends StatefulWidget {
  @override
  _StepCountDetailPageState createState() => _StepCountDetailPageState();
}

class _StepCountDetailPageState extends State<StepCountDetailPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('걸음 수', style: TextStyle(color: Colors.white)),
          backgroundColor: kAccentColor2,
          iconTheme: IconThemeData(color: Colors.white),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Day'),
              Tab(text: 'Week'),
              Tab(text: 'Month'),
            ],
            indicatorColor: Colors.white,
            labelColor: Colors.white,
          ),
        ),
        body: StepCountBody(),
      ),
    );
  }
}