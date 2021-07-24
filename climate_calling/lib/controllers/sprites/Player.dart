import 'dart:ui';

import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/controllers/sprites/Bear.dart';
import 'package:climate_calling/controllers/sprites/PolarBear.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

class Player extends BaseSprite {
  //Fields
  bool isMovingRight = false,
        isMovingLeft = false,
        isMovingUp = false,
        isMovingDown = false;
  double time = 0;
  double height = 0;
  List<Sprite> _spritesLeft, 
                _spritesRight, 
                _spritesLeftPolarBear,
                _spritesRightPolarBear,
                _spritesLeftPandaBear,
                _spritesRightPandaBear,
                _jumpLeft,
                _jumpLeftPolarBear,
                _jumpLeftPandaBear,
                _jumpRight,
                _jumpRightPolarBear,
                _jumpRightPandaBear,
                _deathLeft,
                _deathRight;
  Bear _pickedUpBear;
  Bear get pickedUpBear => this._pickedUpBear;

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
    this._spritesLeftPolarBear = SpriteServices.loadSprites(PATH_PLAYER_LEFT, initialFrame: 7, finalFrame: 10);
    this._spritesRightPolarBear = SpriteServices.loadSprites(PATH_PLAYER_RIGHT, initialFrame: 7, finalFrame: 10);
    this._spritesLeftPandaBear = SpriteServices.loadSprites(PATH_PLAYER_LEFT, initialFrame: 14, finalFrame: 17);
    this._spritesRightPandaBear = SpriteServices.loadSprites(PATH_PLAYER_RIGHT, initialFrame: 14, finalFrame: 17);
    this._jumpLeft = SpriteServices.loadSprites(PATH_PLAYER_LEFT, initialFrame: 12, finalFrame: 11);
    this._jumpRight = SpriteServices.loadSprites(PATH_PLAYER_RIGHT, initialFrame: 12, finalFrame: 11);
    this._jumpLeftPolarBear = SpriteServices.loadSprites(PATH_PLAYER_LEFT, initialFrame: 13, finalFrame: 12);
    this._jumpRightPolarBear = SpriteServices.loadSprites(PATH_PLAYER_RIGHT, initialFrame: 13, finalFrame: 12);
    this._jumpLeftPandaBear = SpriteServices.loadSprites(PATH_PLAYER_LEFT, initialFrame: 20, finalFrame: 19);
    this._jumpRightPandaBear = SpriteServices.loadSprites(PATH_PLAYER_RIGHT, initialFrame: 20, finalFrame: 19);
  }

  //Public Methods
  bool isPickingUpBear() => this._pickedUpBear != null;
  void pickUpBear(Bear bear) {
    if (bear != null && !bear.isPickedUp) {
      this._pickedUpBear = bear;
      if (this.direction == Direction.left) {
        this.setAnimations(bear is PolarBear? this._spritesLeftPolarBear : this._spritesLeftPandaBear);
      } 
      else if (this.direction == Direction.right) {
        this.setAnimations(bear is PolarBear? this._spritesRightPolarBear : this._spritesRightPandaBear);
      }
    }
  }
  void dropBear() {
    this._pickedUpBear = null;
    if (this.direction == Direction.left) {
        this.setAnimations(this._spritesLeft);
      } else if (this.direction == Direction.right) {
        this.setAnimations(this._spritesRight);
      }
  }
  void changeToNormalAnimation() {
    if (this.direction == Direction.left) {
      this.setAnimations(this.isPickingUpBear()? this._pickedUpBear is PolarBear? this._spritesLeftPolarBear : this._spritesLeftPandaBear : this._spritesLeft);
    }
    else if (this.direction == Direction.right) {
      this.setAnimations(this.isPickingUpBear()? this._pickedUpBear is PolarBear? this._spritesRightPolarBear : this._spritesRightPandaBear : this._spritesRight);
    }
  }

  //Overridden Methods
  @override
  void moveLeft() {
    if (this.direction != Direction.left) {
      this.setAnimations(this.isPickingUpBear()? this._pickedUpBear is PolarBear? this._spritesLeftPolarBear : this._spritesLeftPandaBear : this._spritesLeft);
      this.direction = Direction.left;
    }
    super.moveLeft();
  }

  @override
  void moveRight() {
    if (this.direction != Direction.right) {
      this.setAnimations(this.isPickingUpBear()? this._pickedUpBear is PolarBear? this._spritesRightPolarBear : this._spritesRightPandaBear : this._spritesRight);
      this.direction = Direction.right;
    }
    super.moveRight();
    
  }
  @override
  void moveUp() {
    if (this.isJump == false) {
      if (this.direction == Direction.right) {
        this.setAnimations(this.isPickingUpBear()? this._pickedUpBear is PolarBear? this._jumpRightPolarBear : this._jumpRightPandaBear : this._jumpRight);
      }
      else if (this.direction == Direction.left) {
        this.setAnimations(this.isPickingUpBear()? this.pickedUpBear is PolarBear? this._jumpLeftPolarBear : this._jumpLeftPandaBear : this._jumpLeft);
      }
      super.moveUp();
      Flame.audio.play(PATH_SOUND_JUMP);
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