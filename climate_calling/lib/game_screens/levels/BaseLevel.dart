import 'package:climate_calling/controllers/BaseTimedWidget.dart';
import 'package:climate_calling/controllers/sprites/Player.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseLevel extends BaseTimedWidget{
  //Fields
  @protected
  Player player;
  double gravity;
  Size size = Size(0, 0);

  //Constructor
  BaseLevel(double x, double y, {double gravity = 5}) {
    this.player = Player();
    this.gravity = gravity;

    //Apply gravity to player
    this.player.gravity = gravity;

    //Move the player to the desired position
    this.player.getAnimationComponent().x = x;
    this.player.getAnimationComponent().y = y;
  }

  //Public Methods
  bool isLevelFinished();

  //Overridden Methods
  @override
  void resize(Size size) {
    this.size = size;
  }

  @override
  void update(double t) {
    this.player.update(t);

    //If player goes off screen, stop applying gravity and prevent it from sinkin
    if (this.player.getAnimationComponent().y + this.player.getAnimationComponent().height >= this.size.height) {
      this.player.getAnimationComponent().y = this.size.height - this.player.getAnimationComponent().height;
    } else {
      this.player.applyGravity();
    }
  }

  @override
  void onTapDown(TapDownDetails details, Function fn) {}

  @override
  void render(Canvas canvas) {}
}