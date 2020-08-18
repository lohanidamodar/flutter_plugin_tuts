import 'package:flutter/material.dart';
import 'package:flutter_link_preview/flutter_link_preview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Plugins Tutorials',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final String article =
      "https://medium.com/@LohaniDamodar/flutter-recipes-2-firebase-firestore-recipes-2f09e58a7298";
  final String video = "https://www.youtube.com/watch?v=BA5geMDGe1o";
  final String articleNoImage =
      "https://medium.com/flutter-community/importance-of-keys-in-flutter-8e56cf9049b5";
  final String image =
      "https://cdn.pixabay.com/photo/2020/08/13/17/55/dom-5485962_960_720.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Plugins Tutorials'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          FlutterLinkPreview(
            url: article,
            bodyStyle: TextStyle(
              fontSize: 18.0,
            ),
            titleStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            showMultimedia: true,
            builder: (info) {
              if (info is WebInfo) {
                return SizedBox(
                  height: 350,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (info.image != null)
                          Expanded(
                              child: Image.network(
                            info.image,
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                          )),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                          child: Text(
                            info.title,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (info.description != null)
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(info.description),
                          ),
                      ],
                    ),
                  ),
                );
              }
              if (info is WebImageInfo) {
                return SizedBox(
                  height: 350,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      info.image,
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                    ),
                  ),
                );
              } else if (info is WebVideoInfo) {
                return SizedBox(
                  height: 350,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      info.image,
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                    ),
                  ),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
