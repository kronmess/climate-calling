import 'dart:ui';

import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:flame/sprite.dart';

class Player extends BaseSprite {
  //Fields
  bool isPickedUp = false,    //Tells if the player is currently guiding another sprite
        isMovingRight = false,
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

  //Constructor
  Player({Size fixedSize}) : super(SpriteServices.loadSprites(PATH_PLAYER_RIGHT, initialFrame: 1, finalFrame: 4), fixedSize: fixedSize) {
    this._spritesRight = SpriteServices.loadSprites(PATH_PLAYER_RIGHT, initialFrame: 1, finalFrame: 4);
    this._spritesLeft = SpriteServices.loadSprites(PATH_PLAYER_LEFT, initialFrame: 1, finalFrame: 4);
    this._spritesLeftBear = SpriteServices.loadSprites(PATH_PLAYER_LEFT, initialFrame: 7, finalFrame: 10);
    this._spritesRightBear = SpriteServices.loadSprites(PATH_PLAYER_RIGHT, initialFrame: 7, finalFrame: 10);
    this._jumpLeft = SpriteServices.loadSprites(PATH_PLAYER_LEFT, initialFrame: 11, finalFrame: 11);
    this._jumpRight = SpriteServices.loadSprites(PATH_PLAYER_RIGHT, initialFrame: 11, finalFrame: 11);
    this._jumpLeftBear = SpriteServices.loadSprites(PATH_PLAYER_LEFT, initialFrame: 12, finalFrame: 12);
    this._jumpRightBear = SpriteServices.loadSprites(PATH_PLAYER_RIGHT, initialFrame: 12, finalFrame: 12);
  }

  //Overridden Methods
  @override
  void moveLeft() {
    if (this.direction != BaseSprite.LEFT) {
      this.setAnimations(this.isPickedUp? this._spritesLeftBear : this._spritesLeft);
      this.direction = BaseSprite.LEFT;
    }
    super.moveLeft();
  }

  @override
  void moveRight() {
    if (this.direction != BaseSprite.RIGHT) {
      this.setAnimations(this.isPickedUp? this._spritesRightBear : this._spritesRight);
      this.direction = BaseSprite.RIGHT;
    }
    super.moveRight();
    
  }
  @override
 void moveUp() {
  if (this.isJump == false) {
    if (this.direction == BaseSprite.RIGHT) {
      this.setAnimations(this.isPickedUp? this._jumpRightBear : this._jumpRight);
    }
    else if (this.direction == BaseSprite.LEFT) {
      this.setAnimations(this.isPickedUp? this._jumpLeftBear : this._jumpLeft);
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