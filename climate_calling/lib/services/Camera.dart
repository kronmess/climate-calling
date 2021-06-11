import 'dart:math';
import 'dart:ui';

import 'package:climate_calling/controllers/sprites/Background.dart';
import 'package:climate_calling/controllers/sprites/BaseSprite.dart';
import 'package:climate_calling/controllers/sprites/Player.dart';
import 'package:climate_calling/controllers/sprites/Terrain.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flutter/cupertino.dart';

class Camera {

  // Fields
  final double lerp = 0.1;    // For camera movement smoothing
  List<BaseSprite> sprites;
  Background background;
  Size mapSize, phoneSize;
  Player player;
  double x, y;    // Player position in the real world (in the map)
  Point phoneCenter;

  // Constructor
  Camera (
  this.player, {
    @required this.phoneSize,
    @required this.mapSize,
    List<BaseSprite> sprites,
    this.background
  }) {
    this.sprites = [];
    if (sprites != null) {
      this.addSprites(sprites);
    }

    // Update player pos (top left box corner)
    this.x = this.player.getAnimationComponent().x;
    this.y = this.player.getAnimationComponent().y;

    // Calculate phone center
    this.phoneCenter = Point(this.phoneSize.width/2, this.phoneSize.height/2);

    // print("Phone Center: ${this.phoneCenter.x}, ${this.phoneCenter.y}");
    // print("Map Size: ${this.mapSize.width}, ${this.mapSize.height}");
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

  Future<void> update() async {

    Point playerCenter = Point(
        this.player.getAnimationComponent().x + this.player.getAnimationComponent().width/2,
        this.player.getAnimationComponent().y + this.player.getAnimationComponent().height/2
    );

    double deltaX = 0;
    double deltaY = 0;

    // print("${this.x}, ${this.y}");

    if (this.x < this.phoneCenter.x) {
      this.x = playerCenter.x;
    } else if (this.x > this.mapSize.width - this.phoneCenter.x) {
      this.x = this.mapSize.width - this.phoneCenter.x + playerCenter.x;
    } else {
      deltaX = (playerCenter.x - this.phoneCenter.x) * this.lerp;
      this.x += deltaX;   // Update camera pos
      this.player.getAnimationComponent().x += deltaX * -1;   // Update player pos
      this.background.getAnimationComponent().x += deltaX * -1;  // Update background pos
    }

    if (this.y < this.phoneCenter.y) {
      this.y = playerCenter.y;
    } else if (this.y > this.mapSize.height - this.phoneCenter.y) {
      this.y = this.mapSize.height - this.phoneCenter.y + playerCenter.y;
    } else {
      deltaY = (playerCenter.y - this.phoneCenter.y) * this.lerp;
      this.y += deltaY;   // Update camera pos
      this.player.getAnimationComponent().y += deltaY * -1;   // Update player pos
      this.background.getAnimationComponent().y += deltaY * -1;  // Update background pos
    }

    // Update sprite positions
    for (BaseSprite sprite in this.sprites) {
      AnimationComponent ac = sprite.getAnimationComponent();
      ac.x += deltaX * -1;  // Opposite direction
      ac.y += deltaY * -1;  // Opposite direction
    }
  }
}