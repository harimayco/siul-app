import 'package:flutter/material.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:siul/utils/env.dart';

class Article extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int id;
  final String perbuatan;
  final List uu;
  final String pelaku;
  final String dendaMaksimal;
  final String poinPenalti;

  const Article(
      {Key key,
      this.title,
      this.uu,
      this.perbuatan,
      this.imageUrl,
      this.pelaku,
      this.dendaMaksimal,
      this.poinPenalti,
      @required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        actionsIconTheme: IconThemeData(),
        expandedHeight: 200,
        floating: false,
        pinned: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              })
        ],
        elevation: 50,
        flexibleSpace: Container(
          child: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                shadows: [
                  Shadow(
                    blurRadius: 7.0,
                    color: Colors.black,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
            background: Stack(
              children: <Widget>[
                Hero(
                  tag: 'article-image-' + id.toString(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: imageUrl != null
                              ? NetworkImage('$API_URL/$imageUrl')
                              : AssetImage('assets/logo_dishub.png')),
                    ),
                    height: 350.0,
                  ),
                ),
                Container(
                  height: 350.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.grey.withOpacity(0.0),
                            Colors.black38,
                          ],
                          stops: [
                            0.0,
                            1
                          ])),
                )
              ],
            ),
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Pelaku:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  pelaku,
                  //style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Pelanggaran:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                MarkdownBody(
                  data: html2md.convert(perbuatan),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Poin Penalti:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  poinPenalti,
                  //style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Denda Maksimal:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  dendaMaksimal,
                  //style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Pasal:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                _buildPasal(),
              ],
            ),
          ),
        ),
      )
    ]));
  }

  _buildPasal() {
    //print(uu);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: uu.map((item) {
          return Builder(builder: (BuildContext context) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/pasal',
                  arguments: [
                    item['id_uu_lalulintas'],
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

  Future _getArticleContent() async {
    var url = '$API_URL/api/post_detail?id=$id';

    // Await the http get response, then decode the json-formatted response.
    //var wait = await Future.delayed(Duration(seconds: 2));
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse['content'];
    }

    return null;
  }
}
