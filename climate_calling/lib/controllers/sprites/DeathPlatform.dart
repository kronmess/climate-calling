import 'dart:ui';

import 'package:climate_calling/controllers/sprites/Platform.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:climate_calling/shared/constants.dart';

class DeathPlatform extends Platform {
  //Constructor
  DeathPlatform({
    Size fixedSize,
    double xPos,
    double yPos,
    }
  ) : super(
    null,
    fixedSize: fixedSize,
    xPos: xPos,
    yPos: yPos,
  ) {
    this._init(
      fixedSize: fixedSize,
      xPos: xPos,
      yPos: yPos,
    );
  }

  //Private method
  void _init({Size fixedSize, double xPos, double yPos}) async{
    this.initAnimations(
      sprites: SpriteServices.getSpriteImageAsList(await SpriteServices.mergeImage(PATH_ARCTIC_TILE, 1)),
      fixedSize: fixedSize,
      xPos: xPos,
      yPos: yPos,
    );
  }
}