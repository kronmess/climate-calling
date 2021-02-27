import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/controllers/sprites/NPCSprite.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:climate_calling/shared/constants.dart';

class PolarBear extends NPCSprite {
  //Constructor
  PolarBear({double gravity = 5}) : super(SpriteServices.loadSprites(PATH_POLAR_BEAR_RIGHT, 4), gravity: gravity){
    this.getAnimationComponent().width = 500;
    this.getAnimationComponent().height = 300;
  }

  //Overridden Methods
  @override
  void moveLeft() {
    super.moveLeft();
    if (this.direction != BaseSprite.LEFT) {
      this.setAnimations(SpriteServices.loadSprites(PATH_POLAR_BEAR_LEFT, 4));
      this.direction = BaseSprite.LEFT;
    }
  }
  
  @override
  void moveRight() {
    super.moveRight();
    if (this.direction != BaseSprite.RIGHT) {
      this.setAnimations(SpriteServices.loadSprites(PATH_POLAR_BEAR_RIGHT, 4));
      this.direction = BaseSprite.RIGHT;
    }
  }
}