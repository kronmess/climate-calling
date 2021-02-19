import 'package:climate_calling/controllers/BaseTimedWidget.dart';
import 'package:climate_calling/controllers/sprites/Player.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseLevel extends BaseTimedWidget{
  //Fields
  @protected
  Player player;
  double gravity;

  //Constructor
  BaseLevel(double x, double y, {double gravity = 10}) {
    this.player = Player();
    this.gravity = gravity;

    //Move the player to the desired position
    this.player.getAnimationComponent().x = x;
    this.player.getAnimationComponent().y = y;
  }

  //Methods
  bool isLevelFinished();
}