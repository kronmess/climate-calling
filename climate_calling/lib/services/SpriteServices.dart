import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:flame/components/animation_component.dart';

class SpriteServices {

  /**
   * Uses AABB collision detection to detect if 2 sprites collide with one another
   */
  static bool hasCollision(BaseSprite sp1, BaseSprite sp2) {
    AnimationComponent ac1 = sp1.getAnimationComponent();
    AnimationComponent ac2 = sp2.getAnimationComponent();

    return (ac1.x < ac2.x + ac2.width && 
            ac1.x + ac2.width > ac2.x &&
            ac1.y < ac2.y + ac2.height &&
            ac1.y + ac1.height > ac2.y);
  }

  /**
   * Checks if the first sprite is on top of the second sprite
   */
  static bool isDirectlyOnTop(BaseSprite sp1, BaseSprite sp2) {
    AnimationComponent ac1 = sp1.getAnimationComponent();
    AnimationComponent ac2 = sp2.getAnimationComponent();

    return ac1.y + ac1.height == ac2.y;
  }
}