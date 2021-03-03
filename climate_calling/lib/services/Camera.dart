import 'dart:math';
import 'dart:ui';

import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/controllers/sprites/Player.dart';
import 'package:climate_calling/services/SpriteServices.dart';
import 'package:flutter/cupertino.dart';

class Camera{
  //Fields
  List<BaseSprite> sprites = List();    //List of sprites to be moved, Player should not be in here
  double x, y;
  Size maxSize, phoneSize;
  Player player;
  Point prevPlayerCenterPos;

  //Constructors
  Camera(this.player, {@required this.phoneSize, @required this.maxSize, this.sprites}) {
    if (this.sprites == null) {
      this.sprites = List();
    }
    this.prevPlayerCenterPos = SpriteServices.getSpriteCenter(this.player);

    //Attempt to fix max camera size
    if (this.maxSize.width < this.phoneSize.width) this.maxSize = Size(this.phoneSize.width, this.maxSize.height);
    if (this.maxSize.height < this.phoneSize.height) this.maxSize = Size(this.maxSize.width, this.phoneSize.height);

    //Determine camera center
    this.x = this.prevPlayerCenterPos.x;
    this.y = this.prevPlayerCenterPos.y;
    this._updateCameraPos();
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
    Point delta = await this._updateCameraPos();    //Update camera position and get delta
    for (BaseSprite sprite in this.sprites) {
      sprite.getAnimationComponent().x += delta.x;
      sprite.getAnimationComponent().y += delta.y;
    }
  }

  //Private methods
  Future<Point> _updateCameraPos() async {
    Point playerCenter = SpriteServices.getSpriteCenter(this.player);
    Point phoneCenter = Point(this.phoneSize.width/4, this.phoneSize.height/4);
    double xDelta = playerCenter.x - this.prevPlayerCenterPos.x;
    double yDelta = 0;
    //Determine delta
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
      this.player.getAnimationComponent().x += xDelta;    //Make the player remain in the center
    }

    // print("");
    // print("Phone center: ${phoneCenter.x}, ${phoneCenter.y}");
    // print("Player center: ${playerCenter.x}, ${playerCenter.y}");
    // print("Camera Pos: $x, $y");
    // print("Camera max size: ${maxSize.width}, ${maxSize.height}");
    // print("Deltas $xDelta, $yDelta");

    this.prevPlayerCenterPos = SpriteServices.getSpriteCenter(this.player);
    
    return Point(xDelta, yDelta);
  }
}