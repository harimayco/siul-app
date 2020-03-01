import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:siul/utils/env.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String dropdownValue = '';

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Undang Undang Lalulintas App'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              }),
          PopupMenuButton<String>(
              child: Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                      value: 'about',
                      child: ListTile(
                        title: Text('About'),
                      )),
                  PopupMenuItem(
                      value: 'help',
                      child: ListTile(
                        title: Text('Help'),
                      )),
                  PopupMenuItem(
                      value: 'exit',
                      child: ListTile(
                        title: Text('Exit'),
                      )),
                ];
              }),
          Padding(
            padding: EdgeInsets.only(left: 10),
          )
          /*
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.more_vert),
            items: [
              DropdownMenuItem(
                  value: 'about',
                  child: ListTile(
                    title: Text('About'),
                  )),
              DropdownMenuItem(
                  value: 'help',
                  child: ListTile(
                    title: Text('Help'),
                  )),
              DropdownMenuItem(
                  value: 'exit',
                  child: ListTile(
                    title: Text('Exit'),
                  )),
            ],
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
          ),*/
        ],
      ),
      body: FutureBuilder(
          future: _loadPosts(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return _buildListView(snapshot.data);
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget _buildListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
            leading: Container(
                width: 30.0,
                height: 30.0,
                decoration: data[index]['image'] != null
                    ? new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new NetworkImage(
                                "$API_URL/${data[index]['image']}")))
                    : null),
            title: Text(data[index]['title']),
            onTap: () {
              Navigator.pushNamed(context, '/article', arguments: [
                data[index]['id'],
                data[index]['title'],
                data[index]['image']
              ]);
            },
          );
        });
  }

  Future _loadPosts() async {
    var url = '$API_URL/api/post';

    // Await the http get response, then decode the json-formatted response.
    //var wait = await Future.delayed(Duration(seconds: 2));
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse['data'];
    }

    return null;
  }
}
