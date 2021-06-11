import 'dart:ui';

import 'package:climate_calling/controllers/sprites/Terrain.dart';
import 'package:climate_calling/services/SpriteServices.dart';

class Background extends Terrain {
  //Constructor
  Background(
      String path,
      {Size fixedSize}) : super(
    SpriteServices.loadSprites(path, initialFrame: 1, finalFrame: 1),
    true,
    fixedSize: fixedSize,
    xPos: 0,
    yPos: 0,
  );

  //Overridden Methods
  @override
  void onPassThrough(double t) {
  }
}