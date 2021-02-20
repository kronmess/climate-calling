import 'dart:ui';

import 'package:climate_calling/controllers/BaseTimedWidget.dart';
import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';

class BaseSprite extends BaseTimedWidget {
  //Fields
  AnimationComponent _animationComponent;
  double xVelocity, yVelocity, gravity;

  //Constructor
  BaseSprite(List<Sprite> sprites, {
    this.xVelocity = 5, 
    this.yVelocity = 5, 
    this.gravity = 0,
  }) {
    this._animationComponent = AnimationComponent(0, 0, Animation.spriteList(sprites, stepTime: 0.1));
  }

  //Public Methods
  AnimationComponent getAnimationComponent() => _animationComponent;
  void moveLeft() => this._animationComponent.x -= this.xVelocity;
  void moveRight() => this._animationComponent.x += this.xVelocity;
  void moveUp() => this._animationComponent.y -= this.yVelocity;    //Moving up is negative because of how the pixel coordinate works
  void applyGravity() => this._animationComponent.y += this.yVelocity;    //Going down is positive because of how the pixel coordinate works

  //Overridden Methods
  @override
  void onTapDown(TapDownDetails details, Function fn) {}
  
  @override
  void render(Canvas canvas) {
    canvas.save();
    this._animationComponent.render(canvas);
    canvas.restore();
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