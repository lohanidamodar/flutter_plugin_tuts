import 'package:flutter/material.dart';
import 'package:animator/animator.dart';

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
  final animatorKey = AnimatorKey<double>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.pexels.com/photos/68525/soap-colorful-color-fruit-68525.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
                          fit: BoxFit.cover),
                    ),
                    foregroundDecoration:
                        BoxDecoration(color: Colors.pink.withAlpha(180)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Spacer(
                          flex: 2,
                        ),
                        Text(
                          "existing members",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10.0),
                        SizedBox(
                          width: double.infinity,
                          child: Animator(
                            tweenMap: {
                              "first": Tween<double>(
                                  begin: 0, end: 1),
                              "second": Tween<double>(begin: 1, end: 0),
                            },
                            builder: (context, state, child) {
                              return FractionalTranslation(
                                translation: Offset(
                                    state.getAnimation<double>('second').value,
                                    0),
                                child: Transform.scale(scale: state.getAnimation<double>('first').value,child: child),
                              );
                            },
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              padding: const EdgeInsets.all(16.0),
                              color: Colors.white,
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.pink),
                              ),
                              onPressed: () {
                                animatorKey.controller.reverse();
                                animatorKey.refreshAnimation(
                                  tween: Tween<double>(begin: 0.5,end: 1),
                                  curve: Curves.easeInCubic,
                                );
                                // animatorKey.triggerAnimation();
                              },
                            ),
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Animator(
                  animatorKey: animatorKey,
                  triggerOnInit: true,
                  builder: (context,state,child) {
                    return Opacity(
                      opacity: state.value,
                      child: child,
                    );
                  },
                    tween: Tween<double>(begin: 0,end: 1),
                                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Text("or if you are new here"),
                      SizedBox(height: 10.0),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          padding: const EdgeInsets.all(16.0),
                          color: Colors.pink,
                          child: Text(
                            "Sign up",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text("or continue with"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton.icon(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0)),
                            color: Colors.red,
                            icon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Google",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(width: 10.0),
                          RaisedButton.icon(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0)),
                            color: Colors.indigo,
                            icon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Facebook",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Spacer(
                        flex: 2,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
