import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

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
          GoogleSignInButton(
            onPressed: () {},
            borderRadius: 10.0,
            darkMode: true,
            text: "Continue with Google",
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          TwitterSignInButton(
            onPressed: () {},
          ),
          FacebookSignInButton(
            onPressed: () {},
          ),
          MicrosoftSignInButton(
            onPressed: () {},
            darkMode: true,
          ),
          AppleSignInButton(
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
