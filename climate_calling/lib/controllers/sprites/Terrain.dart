import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:flame/sprite.dart';

abstract class Terrain extends BaseSprite {
  //Fields
  bool canPassThrough;

  //Constructor
  Terrain(List<Sprite> sprites, this.canPassThrough) : super(sprites);

  //Abstract methods
  void onPassThrough(double t);
}
