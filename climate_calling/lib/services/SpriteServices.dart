import 'dart:ui' as ui;
import 'dart:math';
import 'dart:ui' as ui;

import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/services/ImageCombiner.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as image;

class SpriteServices {
  
  /// Uses AABB collision detection to detect if 2 sprites collide with one another
  static bool hasCollision(BaseSprite sp1, BaseSprite sp2) {
    AnimationComponent ac1 = sp1.getAnimationComponent();
    AnimationComponent ac2 = sp2.getAnimationComponent();

    return (ac1.x < ac2.x + ac2.width && 
            ac1.x + ac2.width > ac2.x &&
            ac1.y < ac2.y + ac2.height &&
            ac1.y + ac1.height > ac2.y);
  }

  /// Checks if the first sprite is on top of the second sprite
  static bool isDirectlyOnTop(BaseSprite sp1, BaseSprite sp2) {
    AnimationComponent ac1 = sp1.getAnimationComponent();
    AnimationComponent ac2 = sp2.getAnimationComponent();

    return ac1.y + ac1.height == ac2.y;
  }

  /// Combine the same image X times and returns the Image object from Dart UI package
  static Future<ui.Image> mergeImage(String imagePath, int count) async {
    List<image.Image> images = List();
    for (int i=0; i<count; i++) {
      final ByteData assetImageByteData = await rootBundle.load(imagePath);
      image.Image img = image.decodeImage(assetImageByteData.buffer.asUint8List());
      images.add(img);
    }
    ImageCombiner combiner = ImageCombiner();

    for (image.Image img in images) {
      combiner.addImage(img);
    }
    
    image.Image combinedImage = combiner.getCombinedImage();
    ui.Codec codec = await ui.instantiateImageCodec(image.encodePng(combinedImage));
    ui.FrameInfo frameInfo = await codec.getNextFrame();

    return frameInfo.image;
  }

  /// Loads sprites from the resource folder
  static List<Sprite> loadSprites(String folderPath, {@required int initialFrame, @required int finalFrame}) {
    List<Sprite> list = [];

    if (initialFrame <= 0) initialFrame = 1;
    if (finalFrame < initialFrame) finalFrame = initialFrame;

    for (int i=initialFrame; i<=finalFrame; i++) {
      list.add(Sprite("$folderPath$i.png"));
    }

    return list;
  }

  /// Checks if the first sprite passes through the second sprite.
  /// If it does, prevent it. If the first sprite is on top of the second one,
  /// Return true to mark that the first sprite must stop applying gravity.
  static bool checkPassThrough(BaseSprite sp1, BaseSprite sp2) {
    AnimationComponent pAC = sp1.getAnimationComponent();
    AnimationComponent platAC = sp2.getAnimationComponent();

    //Check for y overlap
    if (pAC.y + pAC.height >= platAC.y) {
      pAC.y = platAC.y - pAC.height;
      return true;
    }
    else if (pAC.y <= platAC.y + platAC.height) {
      pAC.y = platAC.y + platAC.height;
    }
    else {
      //Check for x overlap
      if (pAC.x + pAC.width >= platAC.x) {
      pAC.x = platAC.x - pAC.width;
      }
      else if (pAC.x <= platAC.x + platAC.width) {
        pAC.x = platAC.x + platAC.width;
      }
    }

      return false;
  }

  /// Returns the x and y difference between the positions of 2 sprite objects.
  @deprecated
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

  /// Add an image as a list of image consisting of one element
  static List<Sprite> getSpriteImageAsList(ui.Image img) {
    List<Sprite> ls = [];

    Sprite spr = Sprite.fromImage(img);
    ls.add(spr);

    return ls;
  }

  /// Get the location of the sprite's center
  static Point getSpriteCenter(BaseSprite sprite)
  {
    return Point((sprite.getAnimationComponent().x + sprite.getAnimationComponent().width)/2, 
                  (sprite.getAnimationComponent().y + sprite.getAnimationComponent().height)/2);
  }
}