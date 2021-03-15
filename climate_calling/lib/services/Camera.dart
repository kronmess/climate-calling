import 'dart:math';
import 'dart:ui';

import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/controllers/sprites/Player.dart';
import 'package:climate_calling/game_screens/Background.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/components/component.dart';
import 'package:flutter/cupertino.dart';

class Camera{
  //Fields
  List<BaseSprite> sprites = List();    //List of sprites to be moved, Player should not be in here
  Background bg;   //Background if present that should be moved
  double x, y;
  Size maxSize, phoneSize;
  Player player;
  Point prevPlayerCenterPos;

  //Constructors
  Camera(this.player, {@required this.phoneSize, @required this.maxSize, List<BaseSprite> sprites, Background background}) {
    this.sprites = List.empty(growable: true);
    if (this.sprites == null) {
      this.addSprites(sprites);
    }
    this.prevPlayerCenterPos = SpriteServices.getSpriteCenter(this.player);
    this.bg = background;

    //Attempt to fix max camera size
    if (this.maxSize == null || maxSize.width < this.phoneSize.width) this.maxSize = Size(this.phoneSize.width, this.maxSize.height);
    if (this.maxSize == null || this.maxSize.height < this.phoneSize.height) this.maxSize = Size(this.maxSize.width, this.phoneSize.height);

    //Determine camera center
    this.x = this.prevPlayerCenterPos.x;
    this.y = this.prevPlayerCenterPos.y;
    // this._updateCameraPos();
  }

  //Public methods
  void addSprite(BaseSprite sprite) {
    this.sprites.add(sprite);
  }

  void addSprites(List<BaseSprite> sprites) {
    this.sprites.addAll(sprites);
  }

  void setSprites(List<BaseSprite> sprites) {
    this.sprites = sprites;
  }

  List<BaseSprite> getSprites() => this.sprites;

  Future<void> update() async{
    Point<double> phoneCenter = Point(this.phoneSize.width/4, this.phoneSize.height/4);   //Divide by 4 bc idk why honestly
    Point delta = await this._updateCameraPos(phoneCenter);    //Update camera position and get delta
    for (BaseSprite sprite in this.sprites) {
      if (sprite != null) {
        sprite.getAnimationComponent().x += delta.x;
        sprite.getAnimationComponent().y += delta.y;
      }
    }
    // if (this.bg != null) {
    //   this._calcBackgroundPos(this.phoneSize, phoneCenter);
    // }
  }

  //Private methods
  Future<Point> _updateCameraPos(Point phoneCenter) async {
    Point playerCenter = SpriteServices.getSpriteCenter(this.player);
    double xDelta = playerCenter.x - this.prevPlayerCenterPos.x;
    double yDelta = playerCenter.y - this.prevPlayerCenterPos.y;
    AnimationComponent pAC = this.player.getAnimationComponent();
    
    //Determine delta
    //Determine xDelta
    if (this.x <= phoneCenter.x)  //If camera pos is between 0 - phoneCenter.x
    { 
      this.x += xDelta;
      xDelta = 0;   //Prevent other sprites from moving
    }
    else if (this.x >= this.maxSize.width - phoneCenter.x)
    {
      this.x += xDelta;
      xDelta = 0;   //Prevent other sprites from moving
    }
    else    //Between min and max camera pan, this is where sprites will move
    {
      xDelta = playerCenter.x - this.prevPlayerCenterPos.x;   //Calculate delta for camera increment
      this.x += xDelta;
      xDelta *= -1;   //Sprite motion is opposite of the camera
      if (phoneCenter.x != 0) {
        pAC.x = phoneCenter.x * 2 - pAC.width;    //Make the player remain in the center
        // pAC.x = this.x + pAC.width + pAC.width/2;    //Attempt for moving alongside background
      }
    }

    //Determine yDelta
    if (this.y <= phoneCenter.y)  //If camera pos is between 0 - phoneCenter.y
    { 
      this.y += yDelta;
      yDelta = 0;   //Prevent other sprites from moving
    }
    else if (this.y >= this.maxSize.height - phoneCenter.y)
    {
      this.y += yDelta;
      yDelta = 0;   //Prevent other sprites from moving
    }
    else    //Between min and max camera pan, this is where sprites will move
    {
      yDelta = playerCenter.y - this.prevPlayerCenterPos.y;   //Calculate delta for camera increment
      this.y += yDelta;
      yDelta *= -1;   //Sprite motion is opposite of the camera
      if (phoneCenter.y != 0) {
        pAC.y = phoneCenter.y * 2 - pAC.height;    //Make the player remain in the center
        // pAC.y = this.y + pAC.height - pAC.height/2; //Attempt for moving alongside background
      }
    }

    // print("");
    // print("Phone center: ${phoneCenter.x}, ${phoneCenter.y}");
    // print("Player center: ${playerCenter.x}, ${playerCenter.y}");
    // print("Camera Pos: $x, $y");
    // print("Camera max size: ${maxSize.width}, ${maxSize.height}");
    // print("Deltas $xDelta, $yDelta");
    // print("Background coordinates: ${this.bg.getSpriteComponent().x}, ${this.bg.getSpriteComponent().y}");

    this.prevPlayerCenterPos = SpriteServices.getSpriteCenter(this.player);
    
    return Point(xDelta, yDelta);
  }

  void _calcBackgroundPos(Size phoneSize, Point phoneCenter) {
    // double x = this.x * -1;
    // double y = this.y * -1;
    // this.bg.getSpriteComponent().x = x;
    // this.bg.getSpriteComponent().y = y;
    SpriteComponent bgAC = this.bg.getSpriteComponent();
    if (this.x <= phoneCenter.x) {
      bgAC.x = 0;   //Anchor background to 0 on x on the phone
    }
    else if (this.x >= this.maxSize.width - phoneCenter.x) {
      bgAC.x = 0 - bgAC.width.toDouble() + phoneSize.width;   //Anchor the background image X so that only the remaning right side is visible
    }
    else {
      bgAC.x = 0 - this.x + phoneCenter.x;    //This shifts the virtual world for some reason idk im crying
    }

    if (this.y <= phoneCenter.y) { //If camera pos is between 0 - phoneCenter.y
      bgAC.y = 0;   //Anchor the background y to 0 on the phone
    }
    else if (this.y >= this.maxSize.height - phoneCenter.y) {
      bgAC.y = 0 - bgAC.height.toDouble() + phoneSize.height;   //Anchor the bac kground image y so that only the remaning bottom side is visible
    }
    else {
      bgAC.y = 0 - this.y + phoneCenter.y;  //This shifts the virtual world for some reason idk im crying
    }
  }
}