import 'dart:ui';

import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/controllers/sprites/PolarBear.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:flame/sprite.dart';

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
  PolarBear _pickedUpBear;
  PolarBear get pickedUpBear => this._pickedUpBear;

  //Constructor
  Player(
    {Size fixedSize, 
    double xPos, 
    double yPos}
  ) 
  : super(
    SpriteServices.loadSprites(PATH_PLAYER_RIGHT, initialFrame: 1, finalFrame: 4), 
    fixedSize: fixedSize,
    xPos: xPos,
    yPos: yPos,
  ) {
    this._spritesRight = SpriteServices.loadSprites(PATH_PLAYER_RIGHT, initialFrame: 1, finalFrame: 4);
    this._spritesLeft = SpriteServices.loadSprites(PATH_PLAYER_LEFT, initialFrame: 1, finalFrame: 4);
    this._spritesLeftBear = SpriteServices.loadSprites(PATH_PLAYER_LEFT, initialFrame: 7, finalFrame: 10);
    this._spritesRightBear = SpriteServices.loadSprites(PATH_PLAYER_RIGHT, initialFrame: 7, finalFrame: 10);
    this._jumpLeft = SpriteServices.loadSprites(PATH_PLAYER_LEFT, initialFrame: 11, finalFrame: 11);
    this._jumpRight = SpriteServices.loadSprites(PATH_PLAYER_RIGHT, initialFrame: 11, finalFrame: 11);
    this._jumpLeftBear = SpriteServices.loadSprites(PATH_PLAYER_LEFT, initialFrame: 12, finalFrame: 12);
    this._jumpRightBear = SpriteServices.loadSprites(PATH_PLAYER_RIGHT, initialFrame: 12, finalFrame: 12);
  }

  //Public Methods
  bool isPickingUpBear() => this._pickedUpBear != null;
  void pickUpPolarBear(PolarBear bear) {
    this._pickedUpBear = bear;
    if (bear != null) {
      if (this.direction == Direction.left && this.isIdle) {
        this.setAnimations(this._spritesLeftBear);
      } else if (this.direction == Direction.right  && this.isIdle) {
        this.setAnimations(this._spritesRightBear);
      }
    }
  }
  void dropPolarBear() {
    this._pickedUpBear = null;
    if (this.direction == Direction.left) {
        this.setAnimations(this._spritesLeft);
      } else if (this.direction == Direction.right) {
        this.setAnimations(this._spritesRight);
      }
  }

  //Overridden Methods
  @override
  void moveLeft() {
    if (this.direction != Direction.left) {
      this.setAnimations(this.isPickingUpBear()? this._spritesLeftBear : this._spritesLeft);
      this.direction = Direction.left;
    }
    super.moveLeft();
  }

  @override
  void moveRight() {
    if (this.direction != Direction.right) {
      this.setAnimations(this.isPickingUpBear()? this._spritesRightBear : this._spritesRight);
      this.direction = Direction.right;
    }
    super.moveRight();
    
  }
  @override
  void moveUp() {
    if (this.isJump == false) {
      if (this.direction == Direction.right) {
        this.setAnimations(this.isPickingUpBear()? this._jumpRightBear : this._jumpRight);
      }
      else if (this.direction == Direction.left) {
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