import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:flame/sprite.dart';

import '../../shared/constants.dart';

class Player extends BaseSprite {
  //Fields
  bool _guideMode = false;    //Tells if the player is currently guiding another sprite

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
    super.moveLeft();
  }

  @override
  void moveRight() {
    if (this.direction != BaseSprite.RIGHT) {
      this.setAnimations(SpriteServices.loadSprites(PATH_PLAYER_RIGHT, 4));
      this.direction = BaseSprite.RIGHT;
    }
    super.moveRight();
  }
}