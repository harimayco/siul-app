import 'package:flutter/material.dart';
import 'package:siul/utils/env.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _counter = 0;
  String dropdownValue = '';
  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();

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
        // Here we take the value from the SearchPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Form(
          key: _formKey,
          child: TextFormField(
            controller: _searchController,
            autofocus: true,
            cursorColor: Colors.white,
            showCursor: true,
            style: new TextStyle(color: Colors.white),
            decoration: InputDecoration(
              focusColor: Colors.white,
              hasFloatingPlaceholder: false,
              hintText: 'Search',
              fillColor: Colors.white,
              alignLabelWithHint: true,
              focusedBorder: OutlineInputBorder(
                gapPadding: 1,
                borderSide: BorderSide(color: Colors.transparent),
              ),
              suffixIcon: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white54,
                  ),
                  onPressed: () {
                    _searchController.clear();
                  }),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              }),
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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}