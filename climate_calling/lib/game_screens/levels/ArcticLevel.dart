import 'dart:ui';

import 'package:climate_calling/controllers/sprites/Platform.dart';
import 'package:climate_calling/game_screens/levels/BaseLevel.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';

import '../Background.dart';

class ArcticLevel extends BaseLevel {

  //Fields
  Background _bg;

  //Constructor
  ArcticLevel() : super(250, 0) {
    this._bg = Background("artic level final 2.png");
  }

  //Overridden Methods
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
    this._bg.render(canvas);
    super.render(canvas);
  }

  @override
  void resize(Size size) {
    super.resize(size);
    this._bg.resize(size);
  }

  @override
  void update(double t) {
    super.update(t);
  }

  @override
  void initPlatforms() async{
    Platform plt = Platform.staticPlatform(await SpriteServices.mergeImage(PATH_ARCTIC_TILE, 4));

    plt.getAnimationComponent().x = 250;
    plt.getAnimationComponent().y = 300;

    this.platforms.add(plt);
  }
}