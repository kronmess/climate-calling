import 'dart:ui';

import 'package:climate_calling/controllers/BaseTimedWidget.dart';
import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';

class BaseSprite extends BaseTimedWidget {
  //Fields
  AnimationComponent _animationComponent;

  //Constructor
  BaseSprite(List<Sprite> sprites) {
    this._animationComponent = AnimationComponent(0, 0, Animation.spriteList(sprites, stepTime: 0.1));
  }

  //Public Methods
  AnimationComponent getAnimationComponent() => _animationComponent;

  //Overridden Methods
  @override
  void onTapDown(TapDownDetails details, Function fn) {}
  
  @override
  void render(Canvas canvas) {
    this._animationComponent.render(canvas);
  }

  @override
  void resize(Size size) {
    this._animationComponent.resize(size);
  }

  @override
  void update(double t) {
    this._animationComponent.update(t);
  }
  
}