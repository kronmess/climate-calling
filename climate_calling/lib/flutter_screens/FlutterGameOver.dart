import 'package:climate_calling/controllers/BackgroundButton.dart';
import 'package:climate_calling/shared/ScreenState.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:climate_calling/shared/globals.dart';
import "package:flutter/material.dart";


class FlutterGameOverScreen extends StatefulWidget {
  @override
  _FlutterGameOverScreenState createState() => _FlutterGameOverScreenState();
}

class _FlutterGameOverScreenState extends State<FlutterGameOverScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
      Align(
        child: BackgroundButton(
                  image: AssetImage(PATH_BUTTON_MAIN_MENU),
                  child: Text("Game Over"),
                  padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
                  onTap: () {
                    climateCalling.switchScreen(ScreenState
                        .kPolar);
                  },
                ),
      ),
    );
  }
}
