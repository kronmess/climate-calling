import 'dart:ui';

import 'package:climate_calling/game_screens/levels/BaseLevel.dart';
import 'package:flutter/src/gestures/tap.dart';

class ArcticLevel extends BaseLevel {

  //Constructor
  ArcticLevel() : super(250, 250);

  //Overridden Methods
  @override
  bool isLevelFinished() {
    // TODO: implement isLevelFinished
    return false;
  }

  @override
  void onTapDown(TapDownDetails details, Function fn) {
    // TODO: implement onTapDown
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
  }

  @override
  void resize(Size size) {
  // TODO: implement resize
  }

  @override
  void update(double t) {
    // TODO: implement update
  }
}