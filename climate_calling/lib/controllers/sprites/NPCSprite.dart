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
    gravity = 0, Size fixedSize
  }) : super(spritesRight, gravity: gravity, fixedSize: fixedSize) {
    this._spritesLeft = spritesLeft;
    this._spritesRight = spritesRight;
  }

  //Overridden Methods
  @override
  void moveLeft() {
    if (this.direction != BaseSprite.LEFT) {
      this.setAnimations(this._spritesLeft);
      this.direction = BaseSprite.LEFT;
    }
    super.moveLeft();
  }

  @override
  void moveRight() {
    if (this.direction != BaseSprite.RIGHT) {
      this.setAnimations(this._spritesRight);
      this.direction = BaseSprite.RIGHT;
    }
    super.moveRight();
  }
}