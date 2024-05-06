import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:calendar_agenda/calendar_agenda.dart';
import '../../../../_core/constants/size.dart';
import '../widgets/custom_calendar_Agenda.dart';
import 'food_add_page.dart';

class DietManagementDetailPage extends StatelessWidget {
  final CalendarAgendaController _controller = CalendarAgendaController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('식단 관리', style: TextStyle(color: Colors.white)),
      backgroundColor: kAccentColor2,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: kAccentColor2,
      body: Column(
        children: <Widget>[
          CustomCalendarAgenda(
            controller: _controller,
            initialDate: DateTime.now(),
            onDateSelected: (date) {
              // 날짜 선택 시 실행할 로직을 추가합니다.
            },
          ),
          SizedBox(height: gap_m),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: TColor.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListView(
                padding: EdgeInsets.only(top: 30),
                children: <Widget>[
                  foodCard(context, 'BREAKFAST', '고기와 야채', '200 kcal', 'assets/images/meal1.png'),
                  foodCard(context, 'LUNCH', '버거', '350 kcal', 'assets/images/meal2.png'),
                  foodCard(context, 'DINNER', '콘스프', '500 kcal', 'assets/images/meal3.png'),
                  foodCard(context, 'SNACK', '비빔밥', '180 kcal', 'assets/images/meal4.png'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget foodCard(BuildContext context, String mealType, String title, String calories, String imagePath) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
      color: TColor.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.breakfast_dining, color: kAccentColor2),
              title: Text(mealType),
              trailing: IconButton(
                icon: Icon(Icons.add, color: kAccentColor2),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoodAddPage()), // `FoodAddPage`로 이동
                  );
                },
              ),
            ),
            Divider(),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(imagePath, width: 60, height: 60, fit: BoxFit.cover),
              ),
              title: Text(title),
              subtitle: Text(calories),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: kAccentColor2),
                onPressed: () {
                  // 삭제 로직을 여기에 추가
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
