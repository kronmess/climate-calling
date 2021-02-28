import 'dart:math';
import 'dart:ui';

import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/controllers/sprites/Player.dart';
import 'package:flutter/cupertino.dart';

class Camera{
  //Fields
  List<BaseSprite> sprites = List();    //List of sprites to be moved, Player should not be in here
  double x, y;
  Size maxSize, phoneSize;
  Player player;

  //Constructors
  Camera(this.player, {@required this.phoneSize, @required this.maxSize, this.sprites}) {
    if (this.sprites == null) {
      this.sprites = List();
    }
    //Attempt to fix max camera size
    if (this.maxSize.width < this.phoneSize.width) this.maxSize = Size(this.phoneSize.width, this.maxSize.height);
    if (this.maxSize.height < this.phoneSize.height) this.maxSize = Size(this.maxSize.width, this.phoneSize.height);

    //Determine camera center
    this.x = 0;
    this.y = 0;
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

  void update() {
    Point delta = this._updateCameraPos();    //Update camera position and get delta
    for (BaseSprite sprite in this.sprites) {
      sprite.getAnimationComponent().x += delta.x;
      sprite.getAnimationComponent().y += delta.y;
    }
  }

  //Private methods
  Point _updateCameraPos() {
    double xDelta;
    double yDelta;
    Point playerCenter = Point((player.getAnimationComponent().x + player.getAnimationComponent().width)/2, 
                                (player.getAnimationComponent().y + player.getAnimationComponent().height)/2);
    Point phoneCenter = Point(this.phoneSize.width/2, this.phoneSize.height);
    //Determine delta
    xDelta = this.x - playerCenter.x;
    yDelta = this.y - playerCenter.y;

    //Update camera x position
    if (playerCenter.x < phoneCenter.x) this.x = phoneCenter.x;
    else if (this.phoneSize.width < this.maxSize.width && playerCenter.x > phoneCenter.x) {
      if (playerCenter.x <= this.maxSize.width - phoneCenter.x) this.x = playerCenter.x;        
      else this.x = this.maxSize.width - phoneCenter.x;
    }
    else this.x = playerCenter.x;

    //Update camera y position
    if (playerCenter.y < phoneCenter.y) this.y = phoneCenter.y;
    else if (this.phoneSize.height < this.maxSize.height && playerCenter.y > phoneCenter.y) {
      if (playerCenter.y <= this.maxSize.height - phoneCenter.y) this.y = playerCenter.y;        
      else this.y = this.maxSize.height - phoneCenter.y;
    }
    else this.y = playerCenter.y;
    
    return Point(xDelta, yDelta);
  }
}