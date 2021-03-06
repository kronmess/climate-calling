import 'package:climate_calling/flutter_screens/FlutterGameOver.dart';
import 'package:climate_calling/flutter_screens/FlutterGameSettings.dart';
import 'package:climate_calling/flutter_screens/FlutterMainMenu.dart';
import 'package:climate_calling/flutter_screens/FlutterPlayerControls.dart';
import 'package:climate_calling/shared/ScreenState.dart';
import 'package:climate_calling/shared/globals.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class FlutterScreenManager extends StatefulWidget {
  @override
  _FlutterScreenManagerState createState() => _FlutterScreenManagerState();
}

class _FlutterScreenManagerState extends State<FlutterScreenManager> {

  //Fields
  Widget mainMenu, playerControls, gameSettings, gameOver;

  //Constructor
  _FlutterScreenManagerState() {
    this.mainMenu = FlutterMainMenuScreen();
    this.playerControls = FlutterPlayerControlsScreen();
    this.gameSettings = FlutterGameSettingsScreen();
    this.gameOver = FlutterGameOverScreen();
  }

  //Public methods
  void refreshState() {
    setState((){});
  }

  //Private methods
  Widget _getActiveScreen() {
    switch (screenState) {
      case ScreenState.kMainMenu:
        return this.mainMenu;
      case ScreenState.kGameSettings:
        return this.gameSettings;
      case ScreenState.kGameOver:
        return this.gameOver;
      default:
        return SizedBox();
    }
  }
  bool _showPlayerControls() {
    return screenState == ScreenState.kPolar || screenState == ScreenState.kForest || screenState == ScreenState.kFactory || screenState == ScreenState.kTest;
  }

  //Overridden Methods
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);    //Remove bottom navigation bars
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);   //Make the app to use landscape by default

    climateCalling.setCallBack(this.refreshState);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Climate Calling",
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(    //Allows widgets to be drawn on top of each other (overlapping one another)
          children: [
            climateCalling.widget,    //Flame widget
            this._getActiveScreen(),  //Flutter widget
            this._showPlayerControls()? this.playerControls : SizedBox(),
          ],
        ),
      ),
    );
  }
}