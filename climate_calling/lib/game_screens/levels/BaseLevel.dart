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

  //Constructor
  BaseLevel(double x, double y, {double gravity = 5, Size fixedPlayerSize}) {
    this.player = Player(fixedSize: fixedPlayerSize);
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
    //Prevent player from going over the edge of the screen
    if (this.player.getAnimationComponent().x <= 0) {
      this.player.getAnimationComponent().x = 0;
    }
    else if (this.player.getAnimationComponent().x + this.player.getAnimationComponent().width >= this.size.width) {
      this.player.getAnimationComponent().x = this.size.width - this.player.getAnimationComponent().width;
    }

    Rect playerRect = this.player.getAnimationComponent().toRect();
    for (Platform plt in this.platforms) {
      //Check for player collision with platform
      if (plt.overlaps(playerRect)) {
        SpriteServices.checkPassThrough(this.player, plt);
      }
    }
  }

  @override
  void onTapDown(TapDownDetails details, Function fn) {}

  @override
  void render(Canvas canvas) {
    this.player.render(canvas);
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
  }
}