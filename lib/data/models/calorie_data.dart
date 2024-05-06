class CalorieData {
  final int weight; // 체중 (kg)
  final int height; // 신장 (cm)
  final int age; // 연령 (years)
  final String gender; // 성별 ('male' 또는 'female')
  final int consumedCalories; // 섭취한 칼로리

  CalorieData(this.weight, this.height, this.age, this.gender, this.consumedCalories);

  double getCalorieGoal() {
    if (gender.toLowerCase() == 'male') {
      return (10 * weight) + (6.25 * height) + (5 * age) + 5;
    } else if (gender.toLowerCase() == 'female') {
      return (10 * weight) + (6.25 * height) + (5 * age) - 161;
    } else {
      throw Exception('Invalid gender specified');
    }
  }

  double getConsumedPercentage() {
    double goalCalories = getCalorieGoal();
    if (goalCalories == 0) return 0;
    return (consumedCalories / goalCalories) * 100;
  }
}
