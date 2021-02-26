import 'dart:ui';

import 'package:climate_calling/controllers/BaseTimedWidget.dart';
import 'package:flame/animation.dart' as anim;
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

class BaseSprite extends BaseTimedWidget {
  //Fields
  @protected
  AnimationComponent _animationComponent;
  double xVelocity, yVelocity, gravity;
  int direction;
  static const int LEFT = 0, RIGHT = 1, UP = 2, DOWN = 3, IDLE = 4;

  //Constructor
  BaseSprite(List<Sprite> sprites, {
    this.xVelocity = 5, 
    this.yVelocity = 5, 
    this.gravity = 0,
    double stepTime = 0.1,
    this.direction = BaseSprite.RIGHT,
  }) {
    this._animationComponent = AnimationComponent(0, 0, anim.Animation.spriteList(sprites, stepTime:stepTime));
  }

  //Public Methods
  AnimationComponent getAnimationComponent() => _animationComponent;
  void setAnimations(List<Sprite> sprites, {double stepTime = 0.1}) {
    AnimationComponent old = this._animationComponent;
    this._animationComponent = AnimationComponent(this._animationComponent.width, this._animationComponent.height, anim.Animation.spriteList(sprites, stepTime: stepTime));
    this._animationComponent.x = old.x;
    this._animationComponent.y = old.y;
  }
  void moveLeft() => this._animationComponent.x -= this.xVelocity;
  void moveRight() => this._animationComponent.x += this.xVelocity;
  void moveUp() => this._animationComponent.y -= this.yVelocity;    //Moving up is negative because of how the pixel coordinate works
  void applyGravity() => this._animationComponent.y += this.gravity;    //Going down is positive because of how the pixel coordinate works
  bool overlaps(Rect rect) => rect.overlaps(this._animationComponent.toRect());

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