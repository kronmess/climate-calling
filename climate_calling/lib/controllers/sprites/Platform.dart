import 'package:climate_calling/controllers/sprites/Terrain.dart';
import 'package:flame/sprite.dart';

class Platform extends Terrain {
  //Constructor
  Platform(List<Sprite> sprites) : super(sprites, false);

  //Overrridden Methods
  @override
  void onPassThrough(double t) {
  }
}