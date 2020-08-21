import 'package:flutter/material.dart';
import 'package:connection_status_bar/connection_status_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, _) => Stack(
        children: [
          MaterialApp(
            title: 'Flutter Plugins Tutorials',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: HomePage(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConnectionStatusBar(
              color: Colors.red,
              lookUpAddress: "google.com",
              height: 40.0,
              title: Material(
                color: Colors.transparent,
                child: Text(
                  "Please check your connection",
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
              ),
            ),
          ),
        ],
      ),
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
        children: <Widget>[],
      ),
    );
  }
}
