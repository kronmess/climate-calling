import 'dart:math';

import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';

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

  /**
   * Loads sprites from the resource folder
   */
  static List<Sprite> loadSprites(String folderPath, int frames) {
    List<Sprite> list = List();

    for (int i=1; i<=frames; i++) {
      list.add(Sprite("$folderPath$i.png"));
    }

    return list;
  }

  /**
   * Returns the x and y difference between the positions of 2 sprite objects.
   */
  static Point getDeltaPos(BaseSprite sp1, BaseSprite sp2) {
    //TODO: consider the width and height as well?
    double xDiff = 0;
    double yDiff = 0;

    AnimationComponent ac1 = sp1.getAnimationComponent();
    AnimationComponent ac2 = sp2.getAnimationComponent();

    //Calculate xDiff
    /**
     * 
     */
    // if (ac1.x + ac1.width <= ac2.x) {
    //   xDiff = ac2.x - (ac1.x + ac1.width);
    // } 
    // else if (ac2.x + ac2.width <= ac1.x) {
    //   xDiff = ac1.x - (ac2.x + ac2.width); 
    // }
    // else if (ac1.x <= ac2.x && ac1.x + ac1.width > ac2.x) {
    //   xDiff = ac1.x + ac1.width - ac2.x;
    // }
    // else if (ac1.x >)
    // else xDiff = (ac1.x + ac1.width) - ac2.x;
    if (ac1.x <= ac2.x) {
      if (ac1.x + ac1.width <= ac2.x) {
        xDiff = ac2.x - (ac1.x + ac1.width);
      }
      else {
        xDiff = ac1.x + ac1.width - ac2.x;
      }
    }
    else {  //ac1.x > ac2.x
      if (ac1.x >= ac2.x + ac2.width) {
        xDiff = ac1.x - (ac2.x + ac2.width);
      }
      else {
        //Here, the first sprite is inside the second sprite
      }
    }

    //Calculate yDiff

    return Point(xDiff, yDiff);
  }
}