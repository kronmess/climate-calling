import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/controllers/sprites/Bear.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:flutter/cupertino.dart';

class PolarBear extends Bear {

  //Constructor
  PolarBear({
    double gravity = 5, 
    Size fixedSize,
    double xPos,
    double yPos,
    Direction direction = Direction.right,
  }) : super(
    spritesRight: SpriteServices.loadSprites(PATH_POLAR_BEAR_RIGHT, initialFrame: 1, finalFrame: 4),
    spritesLeft: SpriteServices.loadSprites(PATH_POLAR_BEAR_LEFT, initialFrame: 1, finalFrame: 4), 
    spritesLeftIdle: SpriteServices.loadSprites(PATH_POLAR_BEAR_LEFT, initialFrame: 6, finalFrame: 8),
    spritesLeftDeath: SpriteServices.loadSprites(PATH_POLAR_BEAR_LEFT, initialFrame: 5, finalFrame: 5),
    gravity: gravity,
    fixedSize: fixedSize,
    xPos: xPos,
    yPos: yPos,
    direction: direction
  );
}