import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/controllers/sprites/NPCSprite.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:climate_calling/shared/constants.dart';

class PolarBear extends NPCSprite {
  //Constructor
  PolarBear() : super(SpriteServices.loadSprites(PATH_POLAR_BEAR_RIGHT, 4)){
    this.getAnimationComponent().width = this.getAnimationComponent().animation.currentFrame.sprite.image.width.toDouble();
    this.getAnimationComponent().height = this.getAnimationComponent().animation.currentFrame.sprite.image.height.toDouble();
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