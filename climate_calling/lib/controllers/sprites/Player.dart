import 'package:climate_calling/controllers/sprites/BaseSprite.dart';

class Player extends BaseSprite {
  //Fields
  bool _guideMode = false;    //Tells if the player is currently guiding another sprite

  //Constructor
  //TODO: Load player animations
  Player() : super(null) {
  }
}