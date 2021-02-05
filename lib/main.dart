import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:splashscreen/splashscreen.dart';

void main(){
  runApp(MaterialApp(
    home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new secondPage(),
      title: new Text('Welcome to DEEDIET',
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

class secondPage extends StatelessWidget{
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
                              child: new Text("Male", style: new TextStyle(color: Colors.black, decoration: TextDecoration.none, fontSize: 20.0),
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
                              child: new Text("Female", style: new TextStyle(color: Colors.black, decoration: TextDecoration.none, fontSize: 20.0),
                          )
                          )
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
        ),

      ),
    );




































































  }
}