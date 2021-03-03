import 'dart:ui';

import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:flame/sprite.dart';

class Terrain extends BaseSprite {
  //Fields
  bool canPassThrough;

  //Constructor
  Terrain(List<Sprite> sprites, this.canPassThrough, {Size fixedSize}) : super(sprites, fixedSize: fixedSize) {
    this.getAnimationComponent().width = sprites.elementAt(0).image.width.toDouble();
    this.getAnimationComponent().height = sprites.elementAt(0).image.height.toDouble();
  }

  //Abstract methods
  void onPassThrough(double t){}
}
