import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _ocrCam = FlutterMobileVision.CAMERA_BACK;
  List<OcrText> _texts = [];
  @override
  void initState() {
    super.initState();
    FlutterMobileVision.start().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Plugins Tutorials'),
      ),
      body: Column(
        children: [
          ..._texts.map((t) => Text(
                t.value,
                style: TextStyle(fontSize: 18.0),
              )),
          RaisedButton(
            child: Text("Read Text"),
            onPressed: () async {
              List<OcrText> texts = [];
              try {
                texts = await FlutterMobileVision.read(
                  camera: _ocrCam,
                  waitTap: true,
                );
                setState(() {
                  _texts = texts;
                });
              } on Exception {
                texts.add(OcrText('Failed to recognize'));
              }
            },
          ),
        ],
      ),
    );
  }
}
