import 'dart:core';

import 'dart:math';

class Info {

  String gender;
  double weight;
  double height;
  int age;
  double BMI;
  double BMR;

  Info(this.gender);

  void addInfo(String w, String h, String a){
    this.weight = double.parse(w);
    this.height = double.parse(h);
    this.age = int.parse(a);
  }

  double BMRCalculation(){
    if(gender == "Female") {
      BMR = 655 + (9.6 * weight) + (1.8 * height) + (4.7 * age) * 1.2;
    }
    else if(gender == "Male") {
      BMR = 66 + (13.7 * weight) + (5 * height) + (6.8 * age) * 1.2;
    }
  }

  double BMICalculation(){
    BMI = weight / pow((height / 100), 2);
  }
}