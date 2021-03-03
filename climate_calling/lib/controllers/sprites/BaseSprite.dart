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
  bool isJump;
  int direction;
  Size fixedSize;
  static const int LEFT = 0, RIGHT = 1, UP = 2, DOWN = 3, IDLE = 4;

  //Constructor
  BaseSprite(List<Sprite> sprites, {
    this.xVelocity = 5, 
    this.yVelocity = 70, 
    this.gravity = 0,
    this.isJump = false,
    double stepTime = 0.1,
    this.direction = BaseSprite.RIGHT,
    Size fixedSize,
  }) {
    this._animationComponent = AnimationComponent(0, 0, anim.Animation.spriteList(sprites, stepTime:stepTime));
    this.fixedSize = fixedSize == null ? Size(-1, -1) : fixedSize;
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
  void moveUp() {
    this._animationComponent.y -= this.yVelocity; //Moving up is negative because of how the pixel coordinate works
  }
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
    try
    {
      this._animationComponent.width = this.fixedSize.width != -1 ? this.fixedSize.width : this._animationComponent.animation.currentFrame.sprite.image.width.toDouble();
      this._animationComponent.height = this.fixedSize.height != -1 ? this.fixedSize.height : this._animationComponent.animation.currentFrame.sprite.image.height.toDouble();
    }
    catch(e) {}
  }

  @override
  void update(double t) {
    this._animationComponent.update(t);
    if(this._animationComponent.y >= 200){
      this.isJump = false;
    }
  }
}