import 'dart:async';

import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:climate_calling/shared/globals.dart';

import '../../shared/constants.dart';

class Player extends BaseSprite {
  //Fields
  bool _guideMode = false;    //Tells if the player is currently guiding another sprite
  double time = 0;
  double height = 0;
  double yPos = 0;

  //Constructor
  Player() : super(SpriteServices.loadSprites(PATH_PLAYER_RIGHT, 4)) {
    this.getAnimationComponent().width = 100;
    this.getAnimationComponent().height = 100;
  }

  //Overridden Methods
  @override
  void moveLeft() {
    if (this.direction != BaseSprite.LEFT) {
      this.setAnimations(SpriteServices.loadSprites(PATH_PLAYER_LEFT, 4));
      this.direction = BaseSprite.LEFT;
    }
    Timer.periodic(Duration(milliseconds: 50),(timer) {
      if (playerButton.userIsHoldingButton() == true){
        super.moveLeft();
      }else{
        timer.cancel();
      }
    });
    
  }

  @override
  void moveRight() {
    if (this.direction != BaseSprite.RIGHT) {
      this.setAnimations(SpriteServices.loadSprites(PATH_PLAYER_RIGHT, 4));
      this.direction = BaseSprite.RIGHT;
    }
    Timer.periodic(Duration(milliseconds: 50),(timer) {
      if (playerButton.userIsHoldingButton() == true){
        super.moveRight();
      }else{
        timer.cancel();
      }
    });
    
  }
  @override
 void moveUp() {
   if (this.isJump == false){
    super.moveUp();
    this.isJump = true;
     }
  }
}