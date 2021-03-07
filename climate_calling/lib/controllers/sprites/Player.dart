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
  List<Sprite> spritesLeft, 
                spritesRight, 
                spritesLeftBear, 
                spritesRightBear, 
                jumpLeft, 
                jumpRight;

  //Constructor
  Player({Size fixedSize}) : super(SpriteServices.loadSprites(PATH_PLAYER_RIGHT, 4), fixedSize: fixedSize) {
    this.spritesRight = SpriteServices.loadSprites(PATH_PLAYER_RIGHT, 4);
    this.spritesLeft = SpriteServices.loadSprites(PATH_PLAYER_LEFT, 4);
    //TODO: initialize sprites list for bear left and right, as well as jump left right.
  }

  //Overridden Methods
  @override
  void moveLeft() {
    if (this.direction != BaseSprite.LEFT) {
      this.setAnimations(this.isPickedUp? this.spritesLeftBear : this.spritesLeftBear);
      this.direction = BaseSprite.LEFT;
    }
    super.moveLeft();
  }

  @override
  void moveRight() {
    if (this.direction != BaseSprite.RIGHT) {
      this.setAnimations(this.isPickedUp? this.spritesRightBear : this.spritesRightBear); //TODO: if player is picking up bear, load the pick up polar bear right movement animaiton
      this.direction = BaseSprite.RIGHT;
    }
    super.moveRight();
    
  }
  @override
 void moveUp() {
   if (this.isJump == false){
    super.moveUp();
    this.isJump = true;
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
    }
  }
  void flagLeft(){
    this.isMovingLeft = true;
  }
  void flagLeftNo(){
    this.isMovingLeft = false;
  }

  void flagRight(){
    this.isMovingRight = true;
  }
  void flagRightNo(){
    this.isMovingRight = false;
  }
}