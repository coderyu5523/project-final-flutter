import '../calorie_data.dart';

class Activity {
  final String name;
  final int? walking;
  final int? drinkWater;
  final int? kcal;
  final int? weight;
  final DateTime createdAt;
  final int userHeight;
  final int userAge;
  final String userGender;
  final int? percentage;

  CalorieData? get userCalorieData {
    if (weight != null) {
      return CalorieData(
        weight!,
        userHeight,
        userAge,
        userGender,
        kcal ?? 0,
      );
    }
    return null;
  }

  Activity({
    required this.name,
    this.walking,
    this.drinkWater,
    this.kcal,
    this.weight,
    required this.createdAt,
    required this.userHeight,
    required this.userAge,
    required this.userGender,
    this.percentage,
  });
}

List<Activity> activities = [
  Activity(
    name: "류재성",
    walking: null,
    drinkWater: 8,
    kcal: null,
    weight: null,
    createdAt: DateTime(2024, 5, 1, 9, 0),
    userHeight: 175,
    userAge: 30,
    userGender: 'male',
  ),
  Activity(
    name: "류재성",
    walking: 2000,
    drinkWater: null,
    kcal: 2200,
    weight: null,
    createdAt: DateTime(2024, 5, 1, 12, 25),
    userHeight: 175,
    userAge: 30,
    userGender: 'male',
    percentage: 40,
  ),
  Activity(
    name: "류재성",
    walking: null,
    drinkWater: null,
    kcal: 2200,
    weight: null,
    createdAt: DateTime(2024, 5, 1, 12, 25),
    userHeight: 175,
    userAge: 30,
    userGender: 'male',
    percentage: 40,
  ),
  Activity(
    name: "류재성",
    walking: null,
    drinkWater: null,
    kcal: null,
    weight: 70,
    createdAt: DateTime(2024, 5, 1, 15, 45),
    userHeight: 175,
    userAge: 30,
    userGender: 'male',
  ),
  Activity(
    name: "류재성",
    walking: null,
    drinkWater: 8,
    kcal: null,
    weight: null,
    createdAt: DateTime(2024, 4, 30, 9, 0),
    userHeight: 175,
    userAge: 30,
    userGender: 'male',
  ),
  Activity(
    name: "류재성",
    walking: 2000,
    drinkWater: null,
    kcal: 2200,
    weight: null,
    createdAt: DateTime(2024, 4, 30, 12, 25),
    userHeight: 175,
    userAge: 30,
    userGender: 'male',
    percentage: 40,
  ),
  Activity(
    name: "류재성",
    walking: null,
    drinkWater: null,
    kcal: 2200,
    weight: null,
    createdAt: DateTime(2024, 4, 30, 12, 25),
    userHeight: 175,
    userAge: 30,
    userGender: 'male',
    percentage: 40,
  ),
  Activity(
    name: "류재성",
    walking: null,
    drinkWater: null,
    kcal: null,
    weight: 70,
    createdAt: DateTime(2024, 4, 30, 15, 45),
    userHeight: 175,
    userAge: 30,
    userGender: 'male',
  ),
  Activity(
    name: "류재성",
    walking: null,
    drinkWater: 7,
    kcal: null,
    weight: null,
    createdAt: DateTime(2024, 4, 29, 10, 15),
    userHeight: 175,
    userAge: 30,
    userGender: 'male',
  ),
  Activity(
    name: "류재성",
    walking: 7400,
    drinkWater: null,
    kcal: null,
    weight: null,
    createdAt: DateTime(2024, 4, 29, 8, 30),
    userHeight: 175,
    userAge: 30,
    userGender: 'male',
  ),
  Activity(
    name: "류재성",
    walking: null,
    drinkWater: null,
    kcal: 2150,
    weight: null,
    createdAt: DateTime(2024, 4, 29, 14, 0),
    userHeight: 175,
    userAge: 30,
    userGender: 'male',
  ),
  Activity(
    name: "류재성",
    walking: null,
    drinkWater: null,
    kcal: null,
    weight: 69,
    createdAt: DateTime(2024, 4, 29, 17, 30),
    userHeight: 175,
    userAge: 30,
    userGender: 'male',
  ),
];