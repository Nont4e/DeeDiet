class Meal{
  final int mealID;
  final String name;
  final int calorie;
  final String tag;
  String imgURL;

  Meal(this.mealID, this.name, this.calorie, this.tag, this.imgURL);

  @override
  String toString() {
    return 'Meal{mealID: $mealID, name: $name, calorie: $calorie, tag: $tag, imgURL: $imgURL}';
  }
}