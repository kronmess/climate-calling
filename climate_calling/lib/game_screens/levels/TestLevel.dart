import 'dart:ui' as ui;

import 'package:climate_calling/controllers/sprites/Platform.dart';
import 'package:climate_calling/game_screens/levels/BaseLevel.dart';
import 'package:climate_calling/services/ImageCombiner.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/palette.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as image;
import 'package:flutter/material.dart';

class TestLevel extends BaseLevel {

  //Fields
  PaletteEntry _green = PaletteEntry(Colors.green);

  //Constructor
  TestLevel() : super(250, 0);

  //Overridden Methods
  Future<void> initPlatforms() async{

    Platform plt = Platform.staticPlatform(await SpriteServices.mergeImage(PATH_ARCTIC_TILE, 4));

    plt.getAnimationComponent().x = 250;
    plt.getAnimationComponent().y = 250;

    this.platforms.add(plt);
  }

  @override
  bool isLevelFinished() {
    // TODO: implement isLevelFinished
    return false;
  }

  @override
  void onTapDown(TapDownDetails details, Function fn) {
    super.onTapDown(details, fn);
    // TODO: implement onTapDown
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, this.size.width, this.size.height), this._green.paint);
    super.render(canvas);
  }

  @override
  void update(double t) async{
    super.update(t);
  }
}