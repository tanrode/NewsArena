import 'package:news_arena/wion.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'india_today.dart';
import 'ndtv.dart';

// This example uses the Google Books API to search for books about http.
// https://developers.google.com/books/docs/overview
// Await the http get response, then decode the json-formatted response.
// https://saurav.tech/NewsAPI/top-headlines/category/health/in.json

//General news
var generalUrl =
    Uri.https('saurav.tech', '/NewsAPI/top-headlines/category/general/in.json');
// var url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
var genResponse, genJsonResponse;

//Sports news
var sportsUrl =
    Uri.https('saurav.tech', '/NewsAPI/top-headlines/category/sports/in.json');
var sportsResponse, sportsJsonResponse;

//Sources
var sourcesUrl = Uri.https('saurav.tech', '/NewsAPI/sources.json');
var sourcesResponse, sourcesJsonResponse;

//Technology
var techUrl = Uri.https(
    'saurav.tech', '/NewsAPI/top-headlines/category/technology/in.json');
var techResponse, techJsonResponse;

//Health
var healthUrl =
    Uri.https('saurav.tech', '/NewsAPI/top-headlines/category/health/in.json');
var healthResponse, healthJsonResponse;

//Entertainment
var entertainUrl = Uri.https(
    'saurav.tech', '/NewsAPI/top-headlines/category/entertainment/in.json');
var entertainResponse, entertainJsonResponse;

int ct = 0;

void main(List<String> arguments) async {
  genResponse = await http.get(generalUrl);
  sportsResponse = await http.get(sportsUrl);
  sourcesResponse = await http.get(sourcesUrl);
  techResponse = await http.get(techUrl);
  healthResponse = await http.get(healthUrl);
  entertainResponse = await http.get(entertainUrl);

  //Gen
  if (genResponse.statusCode == 200) {
    //print(genResponse.body);
    genJsonResponse =
        convert.jsonDecode(genResponse.body) as Map<String, dynamic>;
    // itemCount = jsonResponse['totalItems'];
  } else {
    print('Request failed with status: ${genResponse.statusCode}.');
  }

  //Sports
  if (sportsResponse.statusCode == 200) {
    sportsJsonResponse =
        convert.jsonDecode(sportsResponse.body) as Map<String, dynamic>;
  } else {
    print('Request failed with status: ${sportsResponse.statusCode}.');
  }

  //Sources
  if (sourcesResponse.statusCode == 200) {
    // print(sourcesResponse.body);
    sourcesJsonResponse =
        convert.jsonDecode(sourcesResponse.body) as Map<String, dynamic>;

    for (var item in sourcesJsonResponse["sources"]) {
      ct++;
    }
    // print(ct);
  } else {
    print('Request failed with status: ${sourcesResponse.statusCode}.');
  }

  //Technology
  if (techResponse.statusCode == 200) {
    techJsonResponse =
        convert.jsonDecode(techResponse.body) as Map<String, dynamic>;
  } else {
    print('Request failed with status: ${techResponse.statusCode}.');
  }

  //Health
  if (healthResponse.statusCode == 200) {
    healthJsonResponse =
        convert.jsonDecode(healthResponse.body) as Map<String, dynamic>;
  } else {
    print('Request failed with status: ${healthResponse.statusCode}.');
  }

  //Entertainment
  if (entertainResponse.statusCode == 200) {
    entertainJsonResponse =
        convert.jsonDecode(entertainResponse.body) as Map<String, dynamic>;
  } else {
    print('Request failed with status: ${entertainResponse.statusCode}.');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsArena',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var choice = 1;
  String title = "Latest";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: ClipRRect(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(8.0), bottom: Radius.circular(8.0)),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(
                          color: Colors.black,
                          width: 4,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'NewsArena',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ListTile(
                title: Text("Home"),
                onTap: () {
                  setState(() {
                    choice = 1;
                    title = "Latest";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Sports"),
                onTap: () {
                  setState(() {
                    choice = 2;
                    title = "Sports";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Technology"),
                onTap: () {
                  setState(() {
                    choice = 6;
                    title = "Technology";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Health"),
                onTap: () {
                  setState(() {
                    choice = 7;
                    title = "Health";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Entertainment"),
                onTap: () {
                  setState(() {
                    choice = 8;
                    title = "Entertainment";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("NDTV Live"),
                onTap: () {
                  setState(() {
                    choice = 4;
                    title = "NDTV";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("India Today Live"),
                onTap: () {
                  setState(() {
                    choice = 5;
                    title = "India Today";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("WION Live"),
                onTap: () {
                  setState(() {
                    choice = 9;
                    title = "WION";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Sources"),
                onTap: () {
                  setState(() {
                    choice = 3;
                    title = "Sources";
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
      backgroundColor: Colors.amber,
      elevation: 5.0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 7.0, bottom: 7.0, right: 7.0),
          child: ClipOval(
              child: Image.asset('assets/images/NewsArena.png',
                  fit: BoxFit.contain)),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return _buildArticleListView();
  }

  Widget _buildTopHeadlinesTabView() {
    return ListView.builder(
        itemCount: genJsonResponse["totalResults"],
        itemBuilder: (ctx, ind) {
          return Container(
            color: Colors.black87,
            child: Column(
              children: [
                Text(
                  genJsonResponse["articles"][ind]["title"],
                  style: TextStyle(
                      color: ind % 2 == 0 ? Colors.white : Colors.orange),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        });
  }

  Widget _buildArticleListView() {
    var jsonResponse;
    switch (choice) {
      case 1:
        jsonResponse = genJsonResponse;
        break;

      case 2:
        jsonResponse = sportsJsonResponse;
        break;

      case 3:
        return _buildSourcesTabView();
        break;

      case 4:
        return _buildNdtvView();
        break;

      case 5:
        return _buildIndiaTodayView();
        break;

      case 6:
        jsonResponse = techJsonResponse;
        break;

      case 7:
        jsonResponse = healthJsonResponse;
        break;

      case 8:
        jsonResponse = entertainJsonResponse;
        break;

      case 9:
        return _buildWionView();
        break;

      default:
        jsonResponse = genJsonResponse;
    }
    return ListView.builder(
      itemCount: jsonResponse["totalResults"],
      itemBuilder: (ctx, ind) {
        return InkWell(
          onTap: () async {
            if (!await launch(jsonResponse["articles"][ind]["url"] ?? ""))
              throw 'Could not launch URL';
          },
          child: Container(
            margin: EdgeInsets.all(6.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3.0,
                  ),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(jsonResponse["articles"][ind]
                                    ["urlToImage"] !=
                                null
                            ? jsonResponse["articles"][ind]["urlToImage"]!
                            : "http://tbinfo.org/sites/default/files/gallery/News1.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          jsonResponse["articles"][ind]["source"]["name"],
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          " Date: " +
                              DateTime.parse(jsonResponse["articles"][ind]
                                      ["publishedAt"])
                                  .day
                                  .toString() +
                              "/" +
                              DateTime.parse(jsonResponse["articles"][ind]
                                      ["publishedAt"])
                                  .month
                                  .toString() +
                              "/" +
                              DateTime.parse(jsonResponse["articles"][ind]
                                      ["publishedAt"])
                                  .year
                                  .toString() +
                              " ",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                SizedBox(height: 8.0),
                Text(
                  jsonResponse["articles"][ind]["title"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSourcesTabView() {
    return ListView.builder(
      itemCount: ct,
      itemBuilder: (context, index) {
        return sourcesJsonResponse["sources"][index]["country"] == "in"
            ? Card(
                color: Colors.black45,
                child: ListTile(
                  title: Text(
                    sourcesJsonResponse["sources"][index]["name"],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Column(
                    children: [
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        sourcesJsonResponse["sources"][index]["description"],
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            : SizedBox();
      },
    );
  }

  Widget _buildNdtvView() {
    return Ndtv();
  }

  Widget _buildWionView() {
    return Wion();
  }

  Widget _buildIndiaTodayView() {
    return IndiaToday();
  }
}
