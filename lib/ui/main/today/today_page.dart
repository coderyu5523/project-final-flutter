import 'package:flutter/material.dart';
import 'package:project_app/ui/main/today/widgets/today_body.dart';
import 'package:project_app/ui/main/today/widgets/today_header.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          TodayHeader(),
          TodayBody(),
        ],
      ),
    );
  }
}
