import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/controllers/sprites/NPCSprite.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:flutter/cupertino.dart';

class PolarBear extends NPCSprite {

  //Fields
  bool isPickedUp;    //Flags whether it is being picked up by the player or not

  //Constructor
  PolarBear({double gravity = 5}) : super(spritesRight: SpriteServices.loadSprites(PATH_POLAR_BEAR_RIGHT, 4), 
    spritesLeft: SpriteServices.loadSprites(PATH_POLAR_BEAR_LEFT, 4), 
    gravity: gravity
  ){
    this.getAnimationComponent().width = 500;
    this.getAnimationComponent().height = 300;
  }

  //Overridden Methods
  @override
  void moveLeft() {
    super.moveLeft();
    if (this.direction != BaseSprite.LEFT) {
      this.setAnimations(SpriteServices.loadSprites(PATH_POLAR_BEAR_LEFT, 4));
      this.direction = BaseSprite.LEFT;
    }
  }
  
  @override
  void moveRight() {
    super.moveRight();
    if (this.direction != BaseSprite.RIGHT) {
      this.setAnimations(SpriteServices.loadSprites(PATH_POLAR_BEAR_RIGHT, 4));
      this.direction = BaseSprite.RIGHT;
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