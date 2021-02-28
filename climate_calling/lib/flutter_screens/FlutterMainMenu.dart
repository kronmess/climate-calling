import 'package:climate_calling/controllers/BackgroundButton.dart';
import 'package:climate_calling/shared/ScreenState.dart';
import 'package:climate_calling/shared/globals.dart';
import "package:flutter/material.dart";

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
            image: AssetImage(PATH_LOGO_APP),height: 1000,width: 1000,
          ),
        ),
        SizedBox(
          height: 120,
        ),
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BackgroundButton(
                image: AssetImage(PATH_BUTTON_MAIN_MENU),
                text: "Start",
                onTap: () {
                  climateCalling.switchScreen(ScreenState.kPolar); //Changes the screen from main menu to polar bear level TODO: change to the last screen instead
                },
              ),
              BackgroundButton(
                image: AssetImage(PATH_BUTTON_MAIN_MENU),
                text: "Game Settings",
                onTap: () {
                  climateCalling.switchScreen(ScreenState.kGameSettings); //Changes the screen from main menu to settings page
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
