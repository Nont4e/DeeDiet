import 'Meal.dart';

class Plan{
  final int planID;
  final String planName;
  final int dailyCal;
  List<Meal> mealList = [];

  Plan(this.planID, this.planName, this.dailyCal, this.mealList);

  @override
  String toString() {
    return 'Plan{planID: $planID, planName: $planName, dailyCal: $dailyCal, mealList: $mealList}';
  }
}