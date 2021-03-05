import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:splashscreen/splashscreen.dart';

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
                        children: [
                          Container(
                            height: 130,
                            width: 130,
                            color: Colors.amber,
                            child: new Center(
                              child: new Text(
                                "Male",
                                style: new TextStyle(
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                    fontSize: 20.0),
                              ),
                            ),
                          ),
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
                                  child: new FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    formPage()));
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
                    onPressed: () {},
                    color: Colors.amber,
                    child: Text('Calculate BMI'),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
