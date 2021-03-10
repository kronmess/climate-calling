import 'dart:ui';

import 'package:climate_calling/controllers/BaseWidget.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/gestures/tap.dart';

class Background extends BaseWidget {
  //Fields
  SpriteComponent _bgSprite;

  //Constructor
  Background(String src) {
    this._bgSprite = SpriteComponent.fromSprite(0, 0, Sprite(src));
  }
  
  //Public Methods
  SpriteComponent getSpriteComponent() => this._bgSprite;

  //Overridden Methods
  @override
  void onTapDown(TapDownDetails details, Function fn) {
    // TODO: implement onTapDown
  }
  
  @override
  void render(Canvas canvas) {
    this._bgSprite.render(canvas);
  }

  @override
  void resize(Size size) {
    this._bgSprite.width = size.width;
    this._bgSprite.height = size.height;
  }

  @override
  void update() {}
}