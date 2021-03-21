import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/controllers/sprites/NPCSprite.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:flutter/cupertino.dart';

class PolarBear extends NPCSprite {

  //Fields
  bool isPickedUp;    //Flags whether it is being picked up by the player or not

  //Constructor
  PolarBear({
    double gravity = 5, 
    Size fixedSize,
    double xPos,
    double yPos,
  }) : super(
    spritesRight: SpriteServices.loadSprites(PATH_POLAR_BEAR_RIGHT, initialFrame: 1, finalFrame: 4), 
    spritesLeft: SpriteServices.loadSprites(PATH_POLAR_BEAR_LEFT, initialFrame: 1, finalFrame: 4), 
    spritesLeftIdle: SpriteServices.loadSprites(PATH_POLAR_BEAR_LEFT, initialFrame: 6, finalFrame: 8),
    spritesLeftDeath: SpriteServices.loadSprites(PATH_POLAR_BEAR_LEFT, initialFrame: 5, finalFrame: 5),
    gravity: gravity,
    fixedSize: fixedSize,
    xPos: xPos,
    yPos: yPos,
  ){
    this.getAnimationComponent().width = 500;
    this.getAnimationComponent().height = 300;
    this.isPickedUp = false;
  }

  //Overridden Methods
  @override
  void moveLeft() {
    super.moveLeft();
    if (this.direction != Direction.left) {
      this.setAnimations(SpriteServices.loadSprites(PATH_POLAR_BEAR_LEFT, initialFrame: 1, finalFrame: 4));
      this.direction = Direction.left;
    }
  }
  
  @override
  void moveRight() {
    super.moveRight();
    if (this.direction != Direction.right) {
      this.setAnimations(SpriteServices.loadSprites(PATH_POLAR_BEAR_RIGHT, initialFrame: 1, finalFrame: 4));
      this.direction = Direction.right;
    }
  }

  @override
  void render(Canvas canvas) {
    if (!this.isPickedUp) super.render(canvas);
  }

  @override
  void update(double t) {
    if (!this.isPickedUp) super.update(t);
  }

  @override
  void resize(Size size) {
    if (!this.isPickedUp) super.resize(size);
  }
}