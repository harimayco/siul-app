import 'package:flutter/material.dart';
import 'package:siul/pages/about.dart';
import 'package:siul/pages/article.dart';
import 'package:siul/pages/home_page.dart';
import 'package:siul/pages/pasal.dart';
import 'package:siul/pages/search_page.dart';
import 'package:siul/pages/help.dart';

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
          primaryColor: Colors.blue[900],
          appBarTheme: AppBarTheme(
            actionsIconTheme: IconThemeData(color: Colors.yellow[600]),
            iconTheme: IconThemeData(color: Colors.yellow[600]),
            elevation: 5,
          ),
        ),
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.

          '/': (context) => MyHomePage(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/search': (context) => SearchPage(),
          '/about': (context) => AboutPage(),
          '/help': (context) => HelpPage()
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
                  perbuatan: args[3],
                  uu: args[4],
                  pelaku: args[5],
                  poinPenalti: args[6],
                  dendaMaksimal: args[7],
                );
              },
            );
          }
          if (settings.name == '/pasal') {
            final List args = settings.arguments;
            return MaterialPageRoute(
              builder: (context) {
                return PasalPage(
                  id: args[0],
                  title: args[1],
                );
              },
            );
          }
          return null;
        });
  }
}
