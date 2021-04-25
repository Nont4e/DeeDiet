import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:project1/Meal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'Plan.dart';

class MealHelper {
  static Database _database;

  MealHelper._privateConstructor();

  static final MealHelper instance = MealHelper._privateConstructor();

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database;
  }

  _initDatabase() async {
    //Get locla path
    var dir = await getDatabasesPath();
    String path = join(dir, "Meal.db");

    var exist = await databaseExists(path);
    if (exist) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      //Copy data from asset folder
      ByteData data =
          await rootBundle.load(join("assets/databases", "Meal.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      //Write
      await File(path).writeAsBytes(bytes, flush: true);
      print("Copy done!");
    } else {
      print("Opening Existing database");
    }

    return await openDatabase(path);
  }

  Future<List<Plan>> getRecommend(double cal) async {
    var db = await instance.database;
    var rnd = new Random();
    List<Plan> recommend = [];
    List<int> rndSet = [];
    var planResult =
        await db.rawQuery("select * from mealplan where dailyCal <= ${cal}");
    //Select random plan
    while (rndSet.length != 3 && rndSet.length != planResult.length) {
      //print("recommend: " + recommend.length.toString() + " planresult: " + planResult.length.toString());
      int rndNum = rnd.nextInt(planResult.length);
      //print("rndnum: " + rndNum.toString() + " rndset: " + rndSet.toString() + " rndres: " + rndSet.indexOf(rndNum).toString());
      if(rndSet.indexOf(rndNum) == -1) {
        var plan = planResult[rndNum];
        print(plan);
        getAllMeal(plan["planID"]).then((mealList) {
          recommend.add(new Plan(
              plan["planID"], plan["name"], plan["dailyCal"], mealList));
        });
        rndSet.add(rndNum);
      }
    }
    //
    return recommend;
  }

  Future<List<Meal>> getAllMeal(int id) async {
    var db = await instance.database;
    List<Meal> mealList = [];
    var mealResult =
        await db.rawQuery("select * from meal where planID = ${id}");
    mealResult.forEach((meal) {
      mealList.add(new Meal(meal["mealID"], meal["name"], meal["cal"],
          meal["tag"], meal["meal_image"]));
    });
    return mealList;
  }
}
