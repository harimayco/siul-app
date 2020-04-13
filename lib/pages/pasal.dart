import 'package:flutter/material.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:siul/utils/env.dart';

class PasalPage extends StatelessWidget {
  final int id;
  final String title;

  const PasalPage({Key key, this.id, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
            future: _getUUDetail(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    MarkdownBody(
                      data: html2md.convert(snapshot.data['isi']),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      snapshot.data['rel'].length > 0 ? "Related:" : "",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    _buildPasal(snapshot.data['rel']),
                  ],
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  _buildPasal(List rel) {
    //print(uu);
    return Row(
        children: rel.map((item) {
      return Builder(builder: (BuildContext context) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/pasal',
              arguments: [
                item['id'],
                item['label'],
              ],
            );
          },
          child: new Text(
            " - " + item['label'],
            style: TextStyle(color: Colors.blue),
          ),
        );
      });
    }).toList());
  }

  Future _getUUDetail() async {
    var url = '$API_URL/api/uu/$id';

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
