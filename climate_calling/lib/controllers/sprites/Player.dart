import 'dart:ui';

import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/controllers/sprites/PolarBear.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:flame/sprite.dart';
import 'package:flame/time.dart';

class Player extends BaseSprite {
  //Fields
  bool isMovingRight = false,
        isMovingLeft = false,
        isMovingUp = false,
        isMovingDown = false;
  double time = 0;
  double height = 0;
  double yPos = 0;
  List<Sprite> _spritesLeft, 
                _spritesRight, 
                _spritesLeftBear, 
                _spritesRightBear, 
                _jumpLeft,
                _jumpLeftBear, 
                _jumpRight,
                _jumpRightBear;
  PolarBear pickedUpBear;

  //Constructor
  Player({Size fixedSize}) : super(SpriteServices.loadSprites(PATH_PLAYER_RIGHT, 4), fixedSize: fixedSize) {
    this._spritesRight = SpriteServices.loadSprites(PATH_PLAYER_RIGHT, 4);
    this._spritesLeft = SpriteServices.loadSprites(PATH_PLAYER_LEFT, 4);
    //TODO: initialize sprites list for bear left and right, as well as jump left right.
  }

  //Public Methods
  bool isPickingUpBear() => this.pickedUpBear != null;

  //Overridden Methods
  @override
  void moveLeft() {
    if (this.direction != BaseSprite.LEFT) {
      this.setAnimations(this.isPickingUpBear()? this._spritesLeftBear : this._spritesLeft);
      this.direction = BaseSprite.LEFT;
    }
    super.moveLeft();
  }

  @override
  void moveRight() {
    if (this.direction != BaseSprite.RIGHT) {
      this.setAnimations(this.isPickingUpBear()? this._spritesRightBear : this._spritesRight);
      this.direction = BaseSprite.RIGHT;
    }
    super.moveRight();
    
  }
  @override
 void moveUp() {
  if (this.isJump == false) {
    if (this.direction == BaseSprite.RIGHT) {
      this.setAnimations(this.isPickingUpBear()? this._jumpRightBear : this._jumpRight);
    }
    else if (this.direction == BaseSprite.LEFT) {
      this.setAnimations(this.isPickingUpBear()? this._jumpLeftBear : this._jumpLeft);
    }
    super.moveUp();
  }
 }

  @override
  void update(double t) {
    super.update(t);
    if (this.isMovingLeft) {
      this.moveLeft();
    }
    if (this.isMovingRight) {
      this.moveRight();
    }
    if (this.isMovingUp) {
      this.moveUp();
      this.isJump = true;
    }
  }
  void flagisMovingUpNo(){
    this.isMovingUp = false;
  }
}