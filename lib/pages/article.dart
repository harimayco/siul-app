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

  const Article({Key key, this.title, this.imageUrl, @required this.id})
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
          child: FutureBuilder(
            future: _getArticleContent(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                String markdown = html2md.convert(snapshot.data);
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: MarkdownBody(
                    data: markdown,
                  ),
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      )
    ]));
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
