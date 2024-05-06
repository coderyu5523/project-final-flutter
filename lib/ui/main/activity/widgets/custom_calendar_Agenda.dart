import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:calendar_agenda/calendar_agenda.dart';

class CustomCalendarAgenda extends StatelessWidget {
  final CalendarAgendaController controller;
  final DateTime initialDate;
  final Function(DateTime) onDateSelected;

  const CustomCalendarAgenda({
    Key? key,
    required this.controller,
    required this.initialDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CalendarAgenda(
      controller: controller,
      appbar: false,
      selectedDayPosition: SelectedDayPosition.center,
      leading: IconButton(
        onPressed: () {},
        icon: Image.asset("assets/images/arrowleft.png", width: 15, height: 15),
      ),
      training: IconButton(
        onPressed: () {},
        icon: Image.asset("assets/images/arrowright.png", width: 15, height: 15),
      ),
      weekDay: WeekDay.short,
      dayNameFontSize: 14,
      dayNumberFontSize: 23,
      dayBGColor: Colors.transparent,
      titleSpaceBetween: 15,
      backgroundColor: Colors.transparent,
      fullCalendarScroll: FullCalendarScroll.horizontal,
      fullCalendarDay: WeekDay.short,
      selectedDateColor: Colors.white,
      dateColor: Colors.black,
      locale: 'ko',
      initialDate: initialDate,
      calendarEventColor: TColor.primaryColor2,
      firstDate: DateTime.now().subtract(const Duration(days: 140)),
      lastDate: DateTime.now().add(const Duration(days: 60)),
      onDateSelected: onDateSelected,
      selectedDayLogo: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: TColor.primaryG,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
