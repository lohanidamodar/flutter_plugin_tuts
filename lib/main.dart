import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Plugins Tutorials'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          FlatButton(
            child: Text("Launcher flutter dev"),
            onPressed: () {
              launch("https://flutter.dev");
            },
          ),
          FlatButton(
            child: Text("Contact us"),
            onPressed: () {
              launch("tel:+9779818225566");
            },
          ),
          FlatButton(
            child: Text("Send text"),
            onPressed: () {
              launch("sms:+9779818225566");
            },
          ),
          FlatButton(
            child: Text("Unsupported text"),
            onPressed: () async {
              bool canl = await canLaunch("skype://+9779818225566");
              if (canl) {
                launch("skype://+9779818225566");
              } else {
                print("cannot launch");
              }
            },
          ),
          FlatButton(
            child: Text("Send email"),
            onPressed: () {
              Uri uri = Uri(
                scheme: "mailto",
                path: "popupbits@gmail.com",
                queryParameters: {
                  "subject": "Thank you for the tutorial",
                  "body": "The tutorial regarding url_launcher was awesome"
                },
              );
              launch(uri.toString());
            },
          ),
        ],
      ),
    );
  }
}
