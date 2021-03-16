import 'dart:ui';

import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:flame/sprite.dart';

class Terrain extends BaseSprite {
  //Fields
  bool canPassThrough;

  //Constructor
  Terrain(
    List<Sprite> sprites, 
    this.canPassThrough, 
    {Size fixedSize,
    double xPos, 
    double yPos,
  }) : super(
    sprites, 
    fixedSize: fixedSize,
    xPos: xPos,
    yPos: yPos,
  );

  //Abstract methods
  void onPassThrough(double t){}
}
