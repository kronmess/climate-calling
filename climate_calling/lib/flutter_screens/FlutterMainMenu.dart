import 'package:climate_calling/controllers/BackgroundButton.dart';
import 'package:climate_calling/shared/ScreenState.dart';
import 'package:climate_calling/shared/globals.dart';
import "package:flutter/material.dart";

import '../shared/constants.dart';
import '../shared/constants.dart';

class FlutterMainMenuScreen extends StatefulWidget {
  @override
  _FlutterMainMenuScreenState createState() => _FlutterMainMenuScreenState();
}

class _FlutterMainMenuScreenState extends State<FlutterMainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: 2,
          child: Image(
            image: AssetImage(PATH_LOGO_APP),
          ),
        ),
        SizedBox(
          height: 180,
        ),
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BackgroundButton(
                image: AssetImage(PATH_BUTTON_MAIN_MENU),
                text: "Start",
                onTap: (){
                  climateCalling.switchScreen(ScreenState.kPolar); //Changes the screen from main menu to polar bear level TODO: change to the last screen instead
                },
              ),
              //TODO: Replace with second button widget
              FlatButton(
                textColor: Colors.black,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Text(
                  'Game Settings',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  climateCalling.switchScreen(ScreenState.kTest);     //Remove later for screen to go to game settings
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
