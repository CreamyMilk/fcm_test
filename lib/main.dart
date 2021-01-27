import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  String storedData = ".";

  @override
  void initState() {
    super.initState();
    storedData = "Press Button to reload Data";
    //v2 reg.ister ios push notification service
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(
        IosNotificationSettings(),
      );
    } else {
      //_saveDeviceToken();
      //Just to re run job
    }
    //Subscribe to topic frontEND
    _fcm.subscribeToTopic("test");
    //Unsubscribe to topic
    //_fcm.unsubscribeFromTopic("Teneant");
    _fcm.configure(
      //Use for popups and ticks
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage :$message");
        var ms = message["data"];
        var type = ms["type"];
        var desc = ms["desc"];
        if (type == "0") {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: AspectRatio(
                  aspectRatio: 1.5,
                  child: Text("tick MARK"),
                ),
                content: Text("$desc", textAlign: TextAlign.center)),
          );
        } else {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title:
                  AspectRatio(aspectRatio: 1.5, child: Text("Failed Response")),
              content: Text("$desc", textAlign: TextAlign.center),
            ),
          );
        }
      },
      onResume: (Map<String, dynamic> message) async {
        print("onMessage :$message");
      },
      //App closed and you press notification
      onLaunch: (Map<String, dynamic> message) async {
        print("onMessage :$message");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$storedData',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            storedData += storedData;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
