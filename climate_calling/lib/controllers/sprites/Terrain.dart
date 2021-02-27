import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:flame/sprite.dart';

abstract class Terrain extends BaseSprite {
  //Fields
  bool canPassThrough;

  //Constructor
  Terrain(List<Sprite> sprites, this.canPassThrough) : super(sprites) {
    this.getAnimationComponent().width = sprites.elementAt(0).image.width.toDouble();
    this.getAnimationComponent().height = sprites.elementAt(0).image.height.toDouble();
  }

  //Abstract methods
  void onPassThrough(double t);
}
