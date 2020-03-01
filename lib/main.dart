import 'package:flutter/material.dart';
import 'package:siul/pages/article.dart';
import 'package:siul/pages/home_page.dart';
import 'package:siul/pages/search_page.dart';
import 'package:siul/utils/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => Splash(),
          '/home': (context) => MyHomePage(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/search': (context) => SearchPage(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/article') {
            final List args = settings.arguments;
            return MaterialPageRoute(
              builder: (context) {
                return Article(
                  id: args[0],
                  title: args[1],
                  imageUrl: args[2],
                );
              },
            );
          }
        });
  }
}
