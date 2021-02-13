import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:flame/sprite.dart';

class Player extends BaseSprite {
  //Fields
  bool _guideMode = false;    //Tells if the player is currently guiding another sprite

  //Constructor
  //TODO: Load player animations
  Player() : super(SpriteServices.loadSprites('sprites/main_char/right/', 4)) {
    this.getAnimationComponent().width = 100;
    this.getAnimationComponent().height = 100;
  } 
}