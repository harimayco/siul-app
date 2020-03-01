import 'package:flutter/material.dart';
import 'package:siul/pages/home_page.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  const Splash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 4,
        navigateAfterSeconds: new MyHomePage(),
        title: new Text(
          'Undang Undang Lalulintas APP',
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
        ),
        image: new Image.asset('assets/logo_dishub.png'),
        backgroundColor: Colors.blue,
        imageBackground: AssetImage('assets/back.jpg'),
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.white);
  }
}
