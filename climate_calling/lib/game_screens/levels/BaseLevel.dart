import 'package:climate_calling/controllers/BaseTimedWidget.dart';
import 'package:climate_calling/controllers/sprites/Platform.dart';
import 'package:climate_calling/controllers/sprites/Player.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseLevel extends BaseTimedWidget{
  //Fields
  Player player;
  double gravity;
  List<Platform> platforms;
  Size size = Size(0, 0);

  //Constructor
  BaseLevel(double x, double y, {double gravity = 5}) {
    this.player = Player();
    this.gravity = gravity;
    this.platforms = List();

    //Initialize platforms
    this.initPlatforms();

    //Apply gravity to player
    this.player.gravity = gravity;

    //Move the player to the desired position
    this.player.getAnimationComponent().x = x;
    this.player.getAnimationComponent().y = y;
  }

  //abstrasct Methods
  bool isLevelFinished();
  @protected
  void initPlatforms();

  //Overridden Methods
  @override
  void resize(Size size) {
    this.player.resize(size);
    this.size = size;
    for (Platform plt in this.platforms) {
      plt.resize(size);
    }
  }

  @override
  void update(double t) {
    this.player.update(t);
    this.player.applyGravity();

    //If player goes off screen, stop applying gravity and prevent it from sinkin
    if (this.player.getAnimationComponent().y + this.player.getAnimationComponent().height >= this.size.height) {
      this.player.getAnimationComponent().y = this.size.height - this.player.getAnimationComponent().height;
    }

    Rect playerRect = this.player.getAnimationComponent().toRect();
    for (Platform plt in this.platforms) {
      //Check for player collision with platform
      if (plt.overlaps(playerRect)) {
        SpriteServices.checkPassThrough(this.player, plt);
        break;
      }
    }
  }

  @override
  void onTapDown(TapDownDetails details, Function fn) {}

  @override
  void render(Canvas canvas) {
    this.player.render(canvas);
    for (Platform plt in this.platforms) {
      plt.render(canvas);
    }
  }
}