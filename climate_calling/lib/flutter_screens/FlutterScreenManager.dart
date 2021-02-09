import 'package:climate_calling/flutter_screens/FlutterMainMenu.dart';
import 'package:climate_calling/shared/globals.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class FlutterScreenManager extends StatefulWidget {
  @override
  _FlutterScreenManagerState createState() => _FlutterScreenManagerState();
}

class _FlutterScreenManagerState extends State<FlutterScreenManager> {

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);    //Remove bottom navigation bars
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);   //Make the app to use landscape by default
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            climateCalling.widget,
            FlutterMainMenuScreen(),
            //TODO: Add the Flame and flutter widgets here (flame first, then flutter's)
          ],
        ),
      ),
    );
  }
}