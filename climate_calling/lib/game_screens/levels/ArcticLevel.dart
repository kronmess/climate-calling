import 'dart:ui';

import 'package:climate_calling/game_screens/levels/BaseLevel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';

import '../Background.dart';

class ArcticLevel extends BaseLevel {

  //Fields
  Background _bg;
  Size _size = Size(0, 0);

  //Constructor
  ArcticLevel() : super(250, 0, gravity: 0) {
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
    super.render(canvas);
    this._bg.render(canvas);
    this.player.render(canvas);
  }

  @override
  void resize(Size size) {
    super.resize(size);
    this._bg.resize(size);
    this.player.resize(size);
    this._size = size;
  }

  @override
  void update(double t) {
    super.update(t);
    this.player.update(t);
    this.player.applyGravity();
  }
}