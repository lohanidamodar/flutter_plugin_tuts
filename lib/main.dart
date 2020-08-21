import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

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
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Plugins Tutorials'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          FutureBuilder<AndroidDeviceInfo>(
            future: deviceInfo.androidInfo,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                AndroidDeviceInfo info = snapshot.data;
                  return Container(
                    child: Column(
                      children: [
                        Text("${info.brand}",style: Theme.of(context).textTheme.headline5,),
                        Text("${info.device}",style: Theme.of(context).textTheme.headline5),
                        Text("${info.model}",style: Theme.of(context).textTheme.headline5),
                        Text("${info.manufacturer}",style: Theme.of(context).textTheme.headline5),
                        Text("${info.id}",style: Theme.of(context).textTheme.headline5),
                        Text("${info.isPhysicalDevice}",style: Theme.of(context).textTheme.headline5),
                        Text("${info.host}",style: Theme.of(context).textTheme.headline5),
                        
                        Text("${info.version.sdkInt}",style: Theme.of(context).textTheme.headline5),
                      ],
                    ),
                  );
              }
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
