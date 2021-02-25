import 'dart:typed_data';
import 'dart:ui';

import 'package:climate_calling/controllers/sprites/Terrain.dart';
import 'package:flame/sprite.dart';

class Platform extends Terrain {
  //Constructor
  Platform(List<Sprite> sprites) : super(sprites, false);
  Platform.staticPlatform(Image img) : super(_getSpriteImageAsList(img), false);

  //Private Methods
  static List<Sprite> _getSpriteImageAsList(Image img) {
    List<Sprite> ls = List();

    Sprite spr = Sprite.fromImage(img);
    ls.add(spr);

    return ls;
  }

  //Overrridden Methods
  @override
  void onPassThrough(double t) {
  }
} 