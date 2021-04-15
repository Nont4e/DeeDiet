import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Info.dart';

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
  formPage({Key key, @required this.info}) : super(key: key);

  //Class Variable
  final WeightTextCon = TextEditingController();
  final HeightTextCon = TextEditingController();
  final AgeTextCon = TextEditingController();

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
                  onPressed: () {
                    info.AddInfo(WeightTextCon.text, HeightTextCon.text,
                        AgeTextCon.text);
                    info.BMICalculation();
                    info.BMRCalculation();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(
                                  info: this.info,
                                )));
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

  ResultPage({Key key, @required this.info}) : super(key: key);

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
            child: SingleChildScrollView(
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
                    ListView(
                      padding: EdgeInsets.all(5),
                      shrinkWrap: true,
                      children: <Widget>[
                        Card(
                            child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage('assets/images/food2.jpg',),
                            radius: 25.0,
                          ),
                          title: Text(
                            "Meal Hero",
                            style: TextStyle(height: 2),

                          ),
                          tileColor: Color(0xffffc107),
                          subtitle: Text(
                            "Meal for hero\nTotal calories: 1500 Kcal",
                            style: TextStyle(height: 1.4),
                          ),
                        )),
                        Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/food1.png',),
                                radius: 25.0,
                              ),
                          title: Text(
                            "Super Meal",
                            style: TextStyle(height: 2),
                          ),
                          tileColor: Color(0xffffc107),
                          subtitle: Text(
                            "Meal for masculine\nTotal calories: 1300 Kcal",
                            style: TextStyle(height: 1.4),
                          ),
                        )),
                        Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/salad.png',),
                                radius: 25.0,
                              ),
                          title: Text(
                            "Healthy meal",
                            style: TextStyle(height: 2),
                          ),
                          tileColor: Color(0xffffc107),
                          subtitle: Text(
                            "Meal for healthy guy\nTotal calories: 1200 Kcal",
                            style: TextStyle(height: 1.4),
                          ),
                        )),
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
