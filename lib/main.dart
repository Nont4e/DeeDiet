import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project1/meal_helper.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Info.dart';
import 'Meal.dart';
import 'Plan.dart';

void main() {
  runApp(MaterialApp(
    home: Splash(),
  ));
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new FirstPage(),
      title: new Text(
        'Welcome to DEEDIET',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),
      ),
      image: new Image.asset('assets/images/ic_launcher.png'),
      backgroundColor: Colors.black,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 180.0,
      loaderColor: Colors.white,
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'SecondPage',
      home: Container(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset('assets/images/ic_launcher.png'),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                              height: 130,
                              width: 130,
                              color: Colors.amber,
                              child: new Center(
                                  child: new TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => formPage(
                                                      info: Info("Male"),
                                                    )));
                                      },
                                      child: new Text(
                                        "Male",
                                        style: new TextStyle(
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                            fontSize: 20.0),
                                      )))),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              height: 130,
                              width: 130,
                              color: Colors.amber,
                              child: new Center(
                                  child: new TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => formPage(
                                                      info: Info("Female"),
                                                    )));
                                      },
                                      child: new Text(
                                        "Female",
                                        style: new TextStyle(
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                            fontSize: 20.0),
                                      )))),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class formPage extends StatelessWidget {
  //Input
  final Info info;
  MealHelper mealHelper = MealHelper.instance;
  formPage({Key key, @required this.info}) : super(key: key);

  //Class Variable
  final WeightTextCon = TextEditingController();
  final HeightTextCon = TextEditingController();
  final AgeTextCon = TextEditingController();

  List<Plan> recommend = [];

  @override
  void dispose() {
    WeightTextCon.dispose();
    HeightTextCon.dispose();
    AgeTextCon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('DEEDIET'),
        elevation: 0,
        backgroundColor: Color(0xffffc107),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0,
              child: Align(
                alignment: Alignment.center,
                child: Text('Your Weight (in kg)',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            TextField(
              controller: WeightTextCon,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: UnderlineInputBorder()),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              height: 20.0,
              child: Align(
                alignment: Alignment.center,
                child: Text('Your Height (in cm)',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            TextField(
              controller: HeightTextCon,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: UnderlineInputBorder()),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              height: 20.0,
              child: Align(
                alignment: Alignment.center,
                child: Text('Age',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            TextField(
              controller: AgeTextCon,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: UnderlineInputBorder()),
            ),
            SizedBox(
              height: 40.0,
            ),
            Center(
              child: Container(
                width: 150,
                height: 80,
                child: FlatButton(
                  onPressed: () async {
                    info.addInfo(WeightTextCon.text, HeightTextCon.text,
                        AgeTextCon.text);
                    info.BMICalculation();
                    info.BMRCalculation();
                    this.recommend = await mealHelper.getRecommend(info.BMR);
                    Future.delayed(Duration(milliseconds: 500), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(
                                    info: this.info,
                                    recommendPlan: this.recommend,
                                  )));
                    });
                  },
                  color: Colors.amber,
                  child: Text('Calculate BMI'),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class ResultPage extends StatelessWidget {
  final Info info;
  List<Plan> recommendPlan;
  ResultPage({Key key, @required this.info, @required this.recommendPlan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('DEEDIET'),
          elevation: 0,
          backgroundColor: Color(0xffffc107),
        ),
        backgroundColor: Colors.black,
        body: new DefaultTextStyle(
            style: TextStyle(
              fontSize: 16,
              color: Color(0xffffc107),
              height: 2.0,
            ),
            textAlign: TextAlign.left,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffffc107),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Body Information",
                                style: TextStyle(
                                    fontSize: 20,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  "Age: ${info.age}\nGender: ${info.gender}\nWeight: ${info.weight} Kg\nHeight: ${info.height} cm\nBMI: ${info.BMI}"),
                              Text(
                                "BMR: ${info.BMR} Kcal",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Recommended Meal Plan",
                      style: TextStyle(
                          fontSize: 20,
                          height: 1.5,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: recommendPlan.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: ListTile(
                              tileColor: Color(0xffffc107),
                              title: Text(
                                recommendPlan[index].planName,
                                style: TextStyle(fontSize: 18),
                              ),
                              subtitle: Text("Average Daily Calories: " +
                                  recommendPlan[index].dailyCal.toString() +
                                  " Kcal"),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MealPage(
                                            selectedPlan:
                                                recommendPlan[index])));
                              },
                            ),
                          );
                        }),
                  ],
                ),
              ),
            )));
  }
}

class MealPage extends StatelessWidget {
  final Plan selectedPlan;
  List<Meal> mealList;

  MealPage({Key key, @required this.selectedPlan, this.mealList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    mealList = selectedPlan.mealList;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('DEEDIET'),
          elevation: 0,
          backgroundColor: Color(0xffffc107),
        ),
        backgroundColor: Colors.black,
        body: new DefaultTextStyle(
          style: TextStyle(
            fontSize: 16,
            height: 2.0,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    selectedPlan.planName,
                    style: TextStyle(fontSize: 20),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text('Day ${index + 1}'),
                          SizedBox(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Breakfast'),
                            ),
                          ),
                          //Fix the layout
                          SizedBox(
                            height: 75,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage(mealList[(index * 3)].imgURL),
                                radius: 30.0,
                              ),
                              title: Text(mealList[(index * 3)].name),
                              subtitle: Text(
                                  mealList[(index * 3)].calorie.toString()),
                              tileColor: Color(0xffffc107),
                            ),
                          ),
                          SizedBox(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Lunch'),
                            ),
                          ),
                          SizedBox(
                            height: 75,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(
                                    mealList[(index * 3) + 1].imgURL),
                                radius: 30.0,
                              ),
                              title: Text(mealList[(index * 3) + 1].name),
                              subtitle: Text(
                                  mealList[(index * 3) + 1].calorie.toString()),
                              tileColor: Color(0xffffc107),
                            ),
                          ),
                          SizedBox(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Dinner'),
                            ),
                          ),
                          SizedBox(
                            height: 75,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(
                                    mealList[(index * 3) + 2].imgURL),
                                radius: 30.0,
                              ),
                              title: Text(mealList[(index * 3) + 2].name),
                              subtitle: Text(
                                  mealList[(index * 3) + 2].calorie.toString()),
                              tileColor: Color(0xffffc107),
                            ),
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ));
    throw UnimplementedError();
  }
}
