import 'dart:ui';

import 'package:climate_calling/game_screens/levels/BaseLevel.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';

class ArcticLevel extends BaseLevel {

  //Fields
  PaletteEntry _blue = PaletteEntry(Colors.blue);
  Size _size = Size(0, 0);

  //Constructor
  ArcticLevel() : super(250, 0);

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
    canvas.drawRect(Rect.fromLTWH(0, 0, this._size.width, this._size.height), this._blue.paint);
    this.player.render(canvas);
  }

  @override
  void resize(Size size) {
    this.player.resize(size);
    this._size = size;
  }

  @override
  void update(double t) {
    this.player.update(t);
    this.player.applyGravity();
  }
}