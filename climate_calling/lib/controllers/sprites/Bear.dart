import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/controllers/sprites/NPCSprite.dart';
import 'package:flutter/cupertino.dart';

class Bear extends NPCSprite {

  //Fields
  bool isPickedUp;    //Flags whether it is being picked up by the player or not

  //Constructor
  Bear({
    @required spritesRight,
    @required spritesLeft,
    spritesLeftIdle,
    spritesRightIdle,
    spritesLeftDeath,
    spritesRightDeath,
    double gravity = 5,
    Size fixedSize,
    double xPos,
    double yPos,
    Direction direction = Direction.right,
  }) : super(
      spritesRight: spritesRight,
      spritesLeft: spritesLeft,
      spritesLeftIdle: spritesLeftIdle,
      spritesRightIdle: spritesRightIdle,
      spritesLeftDeath: spritesLeftDeath,
      spritesRightDeath: spritesRightDeath,
      gravity: gravity,
      fixedSize: fixedSize,
      xPos: xPos,
      yPos: yPos,
      direction: direction
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
      this.setAnimations(this.spritesLeft);
      this.direction = Direction.left;
    }
  }

  @override
  void moveRight() {
    super.moveRight();
    if (this.direction != Direction.right) {
      this.setAnimations(this.spritesRight);
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