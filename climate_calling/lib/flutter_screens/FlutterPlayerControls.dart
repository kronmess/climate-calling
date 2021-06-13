import 'package:climate_calling/controllers/BackgroundButton.dart';
import 'package:climate_calling/controllers/MovementButton.dart';
import 'package:climate_calling/controllers/Timer.dart';
import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/game_screens/ClimateCalling.dart';
import 'package:climate_calling/game_screens/levels/ArcticLevel.dart';
import 'package:climate_calling/game_screens/levels/BaseLevel.dart';
import 'package:climate_calling/shared/ScreenState.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:climate_calling/shared/globals.dart';
import 'package:flame/flame.dart';
import "package:flutter/material.dart";

class FlutterPlayerControlsScreen extends StatefulWidget {
  @override
  _FlutterPlayerControlsScreenState createState() => _FlutterPlayerControlsScreenState();
  }


class _FlutterPlayerControlsScreenState extends State<FlutterPlayerControlsScreen> {
  bool pickUp = false;
  @override
  Widget build(BuildContext context) {
    BaseLevel level = climateCalling.getActiveScreen() as BaseLevel;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        BackgroundButton(
                image: AssetImage(PATH_BUTTON_POLAR),
                child: Text("Return to Main Menu", 
                style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  climateCalling.switchScreen(ScreenState
                      .kMainMenu);
                },
              ),
        CountDownTimer(
          secondsRemaining: 180, 
          whenTimeExpires: (){
            setState(() {
              level.victory = false;
          });
        },
        countDownTimerStyle:
        TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                height: 1.2),
        ),
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
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(PATH_BUTTON_MOTION_UP),
                    ),
                  ),
                ),
                onTap:(){
                  level.player.isMovingUp = true;                  
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(PATH_BUTTON_PICKUP),
                      fit: BoxFit.fill,
                ),
              ),
              child:Center(
                child: 
                Text(
                  pickUp ? "DROP" : "PICK UP",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 0,
                    ),
                  ) 
                ),
                ),
                onTap: () async {
                  if (screenState == ScreenState.kPolar) {
                    ArcticLevel levelArc = level as ArcticLevel;

                    if(!level.player.isPickingUpBear()){
                      pickUp =  await levelArc.pickUpPolarBear();
                      setState(() {});
                    }else{
                      levelArc.dropPolarBear();
                      pickUp =  await levelArc.dropPolarBear();
                      setState(() {});
                    }
                  }
                },
              ),
            ),
            SizedBox(width: 48),
          ],),
          SizedBox(height:30,)
      ],
      );
  }
}