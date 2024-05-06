import 'package:flutter/material.dart';
import 'package:project_app/ui/main/activity/widgets/activity_body.dart';
import 'package:project_app/ui/main/activity/widgets/activity_header.dart';


class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  DateTime selectedDate = DateTime.now();

  void handleDateChange(DateTime newDate) {
    setState(() {
      selectedDate = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActivityHeader(onDateSelected: handleDateChange),
        Expanded(
          child: ActivityBody(selectedDate: selectedDate),
        )
      ],
    );
  }
}