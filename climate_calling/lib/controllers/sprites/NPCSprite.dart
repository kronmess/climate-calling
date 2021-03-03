import 'dart:ui';

import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:flame/sprite.dart';

class NPCSprite extends BaseSprite {
  //Fields
  bool _guided = false;    //Tells if the NPC is currently being guided by the player

  //Constructor
  //TODO: Load player animations
  NPCSprite(List<Sprite> ls, {double gravity = 0, Size fixedSize}) : super(ls, gravity: gravity, fixedSize: fixedSize);
}