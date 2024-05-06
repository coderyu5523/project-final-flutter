import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:calendar_agenda/calendar_agenda.dart';

import '../../../../../_core/constants/style.dart';
import 'custom_calendar_Agenda.dart';

class ActivityHeader extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  const ActivityHeader({Key? key, required this.onDateSelected}) : super(key: key);

  @override
  State<ActivityHeader> createState() => _ActivityHeaderState();
}

class _ActivityHeaderState extends State<ActivityHeader> {
  CalendarAgendaController _calendarAgendaControllerAppBar = CalendarAgendaController();
  late DateTime _selectedDateAppBBar;

  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Text(
            '나의 활동',
            style: h6(mColor: Colors.grey),
          ),
        ),
        // ActivityHeader.dart
        CustomCalendarAgenda(
          controller: _calendarAgendaControllerAppBar,
          initialDate: DateTime.now(),
          onDateSelected: (date) {
            print("Selected date: $date");  // 로그 추가
            widget.onDateSelected(date);   // 콜백 호출
          },
        ),
      ],
    );
  }
}