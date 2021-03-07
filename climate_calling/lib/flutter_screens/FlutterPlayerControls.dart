import 'package:climate_calling/controllers/MovementButton.dart';
import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/game_screens/levels/BaseLevel.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:climate_calling/shared/globals.dart';
import "package:flutter/material.dart";

class FlutterPlayerControlsScreen extends StatefulWidget {
  @override
  _FlutterPlayerControlsScreenState createState() => _FlutterPlayerControlsScreenState();
  }


class _FlutterPlayerControlsScreenState extends State<FlutterPlayerControlsScreen> {
  @override
  Widget build(BuildContext context) {
    BaseLevel level = climateCalling.getActiveScreen() as BaseLevel;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(),
        Row(
          children: [
            SizedBox(width: 30),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                  MovementButton(
                    child: Image.asset(PATH_BUTTON_MOTION_LEFT),
                    functionDown: level.player.flagLeft,
                    functionUp: () {
                      level.player.flagLeftNo();
                      level.player.direction = BaseSprite.IDLE;
                    },
                    
                  ),
                  SizedBox(width: 50),
                  MovementButton(
                    child: Image.asset(PATH_BUTTON_MOTION_RIGHT),
                    functionDown: level.player.flagRight,
                    functionUp: () {
                      level.player.flagRightNo();
                      level.player.direction = BaseSprite.IDLE;
                    },
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
            Spacer(),
            GestureDetector(
                child: Container(
                  height: 64,
                  width: 64,
                  child: Center(
                    child: Image.asset(PATH_BUTTON_MOTION_UP)
                  ),
                ),
                onTap: level.player.moveUp
              )
            ,
            SizedBox(width: 50),
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
          SizedBox(height:30,)
      ],
      );
  }
}