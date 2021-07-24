import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/controllers/sprites/Bear.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:flutter/cupertino.dart';

class PandaBear extends Bear {

  //Fields
  bool isPickedUp;    //Flags whether it is being picked up by the player or not

  //Constructor
  PandaBear({
    double gravity = 5, 
    Size fixedSize,
    double xPos,
    double yPos,
    Direction direction = Direction.right,
  }) : super(
    spritesRight: SpriteServices.loadSprites(PATH_PANDA_BEAR_RIGHT, initialFrame: 1, finalFrame: 4),
    spritesLeft: SpriteServices.loadSprites(PATH_PANDA_BEAR_LEFT, initialFrame: 1, finalFrame: 4),
    gravity: gravity,
    fixedSize: fixedSize,
    xPos: xPos,
    yPos: yPos,
    direction: direction
  );
}