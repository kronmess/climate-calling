import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:flame/sprite.dart';

class Player extends BaseSprite {
  //Fields
  bool _guideMode = false;    //Tells if the player is currently guiding another sprite

  //Constructor
  //TODO: Load player animations
  Player() : super([1,2,3,4].map((e) => Sprite('sprites/main_char/right/$e.png')).toList()) {
    this.getAnimationComponent().width = 100;
    this.getAnimationComponent().height = 100;
  } 
}