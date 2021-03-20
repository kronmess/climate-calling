import 'dart:ui';

import 'package:climate_calling/controllers/BaseTimedWidget.dart';
import 'package:flame/animation.dart' as anim;
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

enum Direction {
  left,
  right,
}

enum MovementStatus {
  idle,
  up,
  down
}

class BaseSprite extends BaseTimedWidget {
  //Fields
  @protected
  AnimationComponent animationComponent;
  double xVelocity, yVelocity, gravity;
  bool isJump;
  Direction direction;
  MovementStatus movementStatus;
  Size fixedSize;
  bool isGravityApplied = true;

  //Constructor
  BaseSprite(List<Sprite> sprites, {
    this.xVelocity = 5, 
    this.yVelocity = 200, 
    this.gravity = 0,
    this.isJump = false,
    double stepTime = 0.1,
    this.direction = Direction.right,
    this.movementStatus = MovementStatus.idle,
    Size fixedSize,
    double xPos = 0,
    double yPos = 0,
  }) {
    this.initAnimations(
      sprites: sprites,
      fixedSize: fixedSize,
      stepTime: stepTime,
      xPos: xPos,
      yPos: yPos,
    );
  }

  //Public Methods
  AnimationComponent getAnimationComponent() => animationComponent;
  void setAnimations(List<Sprite> sprites, {double stepTime = 0.1}) {
    try {
      AnimationComponent old = this.animationComponent;
    this.animationComponent = AnimationComponent(this.animationComponent.width, this.animationComponent.height, anim.Animation.spriteList(sprites, stepTime: stepTime));
    this.animationComponent.x = old.x;
    this.animationComponent.y = old.y;
    } catch(e) {}
  }
  
  void moveLeft() {
    this.animationComponent.x -= this.xVelocity;
  }
  void moveRight() => this.animationComponent.x += this.xVelocity; 
  void moveUp() {
    this.animationComponent.y -= this.yVelocity; //Moving up is negative because of how the pixel coordinate works
  }
  void applyGravity() {
    if (this.isGravityApplied) this.animationComponent.y += this.gravity;    //Going down is positive because of how the pixel coordinate works
  }
  bool overlaps(Rect rect) => rect.overlaps(this.animationComponent.toRect());

  //Protected Methods
  @protected
  void initAnimations({
    @required List<Sprite> sprites,
    double xPos = 0,
    double yPos = 0,
    double stepTime = 0.1,
    Size fixedSize,
  }) {
    this.animationComponent = sprites == null ? null : AnimationComponent(0, 0, anim.Animation.spriteList(sprites, stepTime:stepTime));
    this.fixedSize = fixedSize == null ? Size(-1, -1) : fixedSize;

    this.animationComponent.x = xPos == null? 0 : xPos;
    this.animationComponent.y = yPos == null? 0 : yPos;
  }

  //Overridden Methods
  @override
  void onTapDown(TapDownDetails details, Function fn) {}
  
  @override
  void render(Canvas canvas) {
    canvas.save();
    this.animationComponent.render(canvas);
    canvas.restore();
  }

  @override
  void resize(Size size) {
    this.animationComponent.resize(size);
    try
    {
      this.animationComponent.width = this.fixedSize.width != -1 ? this.fixedSize.width : this.animationComponent.animation.currentFrame.sprite.image.width.toDouble();
      this.animationComponent.height = this.fixedSize.height != -1 ? this.fixedSize.height : this.animationComponent.animation.currentFrame.sprite.image.height.toDouble();
    }
    catch(e) {}
  }

  @override
  void update(double t) {
    this.animationComponent?.update(t);
    //Set idle animation
    if (this.movementStatus == MovementStatus.idle) {
      this.animationComponent.animation.currentIndex = 0;
    }
  }
}