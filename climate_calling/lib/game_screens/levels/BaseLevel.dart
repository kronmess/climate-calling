import 'package:climate_calling/controllers/BaseTimedWidget.dart';
import 'package:climate_calling/controllers/sprites/Platform.dart';
import 'package:climate_calling/controllers/sprites/Player.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseLevel extends BaseTimedWidget{
  //Fields
  Player player;
  double gravity;
  List<Platform> platforms;
  Size size = Size(0, 0);
  bool applyGravity;

  //Constructor
  BaseLevel(double x, double y, {double gravity = 5, Size fixedPlayerSize}) {
    this.player = Player(fixedSize: fixedPlayerSize);
    this.gravity = gravity;
    this.platforms = List();
    this.applyGravity = true;

    //Initialize platforms and terrain
    this.initPlatforms();
    this.initTerrain();

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
  @protected
  void initTerrain();

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
    this.player.isMovingDown = true;
    this.player.applyGravity();
    AnimationComponent pAC = this.player.getAnimationComponent();

    //If player goes off screen, stop applying gravity and prevent it from sinkin
    if (pAC.y + pAC.height >= this.size.height) {
      pAC.y = this.size.height - pAC.height;
      this.player.isMovingDown = false;
    }
    //Prevent player from going over the edge of the screen
    if (pAC.x < 0) {
      pAC.x = 0;
    }
    else if (pAC.x + pAC.width >= this.size.width) {
      pAC.x = this.size.width - pAC.width;
    }

    Rect playerRect = pAC.toRect();
    for (Platform plt in this.platforms) {
      //Check for player collision with platform
      if (plt.overlaps(playerRect)) {
        // SpriteServices.checkPassThrough(this.player, plt);
        AnimationComponent platAC = plt.getAnimationComponent();
        if (this.player.isMovingDown && pAC.y + pAC.height <= platAC.y + this.gravity) {    //Use gravity value for margin of error
          pAC.y = platAC.y - pAC.height;
          this.player.isMovingDown = false;
        }
        // if (this.player.isMovingUp) {
        //   pAC.y = platAC.y + platAC.height;
        // }
        // if (this.player.isMovingRight && !this.player.isMovingDown && !SpriteServices.isDirectlyOnTop(this.player, plt)) {
        //   pAC.x = platAC.x - pAC.width;
        // }
        // if (this.player.isMovingLeft && !this.player.isMovingDown && !SpriteServices.isDirectlyOnTop(this.player, plt)) {
        //   pAC.x = platAC.x + platAC.width;
        // }
        if(!SpriteServices.isDirectlyOnTop(this.player, plt)){
          this.player.isMovingUp = false;
          this.player.isJump = false;
        }
      }
    }
  }

  @override
  void onTapDown(TapDownDetails details, Function fn) {}

  @override
  void render(Canvas canvas) {
    for (Platform plt in this.platforms) {
      AnimationComponent ac = plt.getAnimationComponent();
      //Only render if the position of the platform is within the phone screen
      if (ac.x + ac.width >= 0 && 
          ac.x <= this.size.width &&
          ac.y + ac.height >= 0 &&
          ac.y <= this.size.height
      ) {
        plt.render(canvas);
      }
    }
    this.player.render(canvas);
  }
}