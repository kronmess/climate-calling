import 'dart:ui';

import 'package:climate_calling/controllers/sprites/Terrain.dart';
import 'package:flame/sprite.dart';

class Platform extends Terrain {
  //Constructor
  Platform(List<Sprite> sprites, {Size fixedSize}) : super(sprites, false, fixedSize: fixedSize);
  @deprecated
  Platform.from(Platform platform, {Size fixedSize}) : super(null, false, fixedSize: fixedSize == null? platform.fixedSize : fixedSize)
  {
    this.animationComponent = platform.getAnimationComponent();
    this.animationComponent.width = this.fixedSize.width;
    this.animationComponent.height = this.fixedSize.height;
  }

  //Overrridden Methods
  @override
  void onPassThrough(double t) {
  }
}