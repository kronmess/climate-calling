import 'dart:ui';

import 'package:climate_calling/controllers/sprites/Terrain.dart';
import 'package:flame/sprite.dart';

class Platform extends Terrain {
  //Constructor
  Platform(List<Sprite> sprites, {Size fixedSize}) : super(sprites, false, fixedSize: fixedSize);

  //Overrridden Methods
  @override
  void onPassThrough(double t) {
  }
}