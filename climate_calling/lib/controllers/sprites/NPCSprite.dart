import 'dart:ui';

import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

class NPCSprite extends BaseSprite {
  //Fields
  List<Sprite> _spritesLeft, _spritesRight;

  //Constructor
  NPCSprite({@required List<Sprite> spritesLeft, 
    @required List<Sprite> spritesRight, 
    double gravity = 0, 
    Size fixedSize,
    double xPos,
    double yPos,
  }) : super(
    spritesRight, 
    gravity: gravity, 
    fixedSize: fixedSize,
    xPos: xPos,
    yPos: yPos,
    ) {
    this._spritesLeft = spritesLeft;
    this._spritesRight = spritesRight;
  }

  //Overridden Methods
  @override
  void moveLeft() {
    if (this.direction != Direction.left) {
      this.setAnimations(this._spritesLeft);
      this.direction = Direction.left;
    }
    super.moveLeft();
  }

  @override
  void moveRight() {
    if (this.direction != Direction.right) {
      this.setAnimations(this._spritesRight);
      this.direction = Direction.right;
    }
    super.moveRight();
  }
}