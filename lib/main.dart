import 'package:flutter/material.dart';
import 'package:floating_action_row/floating_action_row.dart';

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
        children: <Widget>[],
      ),
      floatingActionButton: FloatingActionRow(
        color: Colors.redAccent,
        axis: Axis.vertical,
        children: [
          FloatingActionRowButton(
            icon: Icon(Icons.home),
            onTap: () {},
          ),
          FloatingActionRowDivider(),
          FloatingActionRowButton(
            icon: Icon(Icons.message),
            onTap: () {},
          ),
          FloatingActionRowDivider(),
          FloatingActionRowButton(
            icon: Icon(Icons.help),
            onTap: () {},
          ),
          FloatingActionRowDivider(),
          FloatingActionRowButton(
            icon: Icon(Icons.more_horiz),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
