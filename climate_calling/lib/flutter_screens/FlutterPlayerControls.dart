import 'package:climate_calling/controllers/MovementButton.dart';
import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/game_screens/levels/ArcticLevel.dart';
import 'package:climate_calling/game_screens/levels/BaseLevel.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:climate_calling/shared/globals.dart';
import 'package:flame/flame.dart';
import "package:flutter/material.dart";

class FlutterPlayerControlsScreen extends StatefulWidget {
  @override
  _FlutterPlayerControlsScreenState createState() => _FlutterPlayerControlsScreenState();
  }


class _FlutterPlayerControlsScreenState extends State<FlutterPlayerControlsScreen> {
  @override
  Widget build(BuildContext context) {
    BaseLevel level = climateCalling.getActiveScreen() as BaseLevel;
    ArcticLevel levelArc = level as ArcticLevel;
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
                    functionDown: (){
                      level.player.isMovingLeft = true;
                      level.player.movementStatus = null;
                    },
                    functionUp: () {
                      level.player.isMovingLeft = false;
                      level.player.movementStatus = MovementStatus.idle;
                    },
                    
                  ),
                  SizedBox(width: 50),
                  MovementButton(
                    child: Image.asset(PATH_BUTTON_MOTION_RIGHT),
                    functionDown:(){
                      level.player.isMovingRight = true;
                      level.player.movementStatus = null;
                    },
                    functionUp: () {
                      level.player.isMovingRight = false;
                      level.player.movementStatus = MovementStatus.idle;
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
                onTap:(){
                  level.player.isMovingUp = true;
                  Flame.audio.play('jump.ogg');
                  level.player.movementStatus = MovementStatus.up;
                }
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
                onTap: () {
                  if(!level.player.isPickingUpBear()){
                    levelArc.pickUpPolarBear();
                    Flame.audio.play('pick.ogg');
                  }else{
                    levelArc.dropPolarBear();
                    Flame.audio.play('drop.ogg');
                  }                  
                },
                
              ),
            ),//space for pick up button
            SizedBox(width: 48),//space for right of button
          ],),
          SizedBox(height:30,)
      ],
      );
  }
}