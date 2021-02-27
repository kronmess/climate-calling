import 'package:climate_calling/controllers/BaseTimedWidget.dart';
import 'package:climate_calling/controllers/MovementButton.dart';
import 'package:climate_calling/game_screens/levels/ArcticLevel.dart';
import 'package:climate_calling/game_screens/levels/BaseLevel.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:climate_calling/shared/globals.dart';
import "package:flutter/material.dart";

class FlutterArcticLevelScreen extends StatefulWidget {
  @override
  _FlutterArcticLevelScreenState createState() => _FlutterArcticLevelScreenState();
  }


class _FlutterArcticLevelScreenState extends State<FlutterArcticLevelScreen> {
  @override
  Widget build(BuildContext context) {
    BaseLevel level = climateCalling.getActiveScreen() as BaseLevel;
    bool holdingButton = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(),
        Row(
          children: [
            SizedBox(width: 48),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(width: 50),
                    GestureDetector(
                    child: Container(
                      height: 48,
                      width: 48,
                      child: Center(
                        child: Image.asset(PATH_BUTTON_MOTION_UP),
                      ),
                    ),
                    onPanDown: (DragDownDetails d) {
                     
                    },
                    onPanEnd: (DragEndDetails d) {},
                  ),
                    SizedBox(width: 50),
                ],
                ),
                Row(
                  children: [
                  MovementButton(
                    child: Image.asset(PATH_BUTTON_MOTION_LEFT),
                    function: level.player.moveLeft,
                  ),
                  SizedBox(width: 50),
                  MovementButton(
                    child: Image.asset(PATH_BUTTON_MOTION_RIGHT),
                    function: level.player.moveRight,
                  ),
                ],
                ),
                Row(
                  children: [
                    SizedBox(width: 50),
                    SizedBox(width: 48),
                    SizedBox(width: 50),
                  ],)
              ],
            ),
            Spacer(),//middle space
            Center(
              child: GestureDetector(
                child: Container(
                  height: 64,
                  width: 64,
                  child: Center(
                    child: Image.asset(PATH_BUTTON_PICKUP)
                  ),
                ),
                onTap: () {},
              ),
            ),//space for pick up button
            SizedBox(width: 48),//space for right of button
          ],),
          SizedBox(height:18,)
      ],
      );
  }
}