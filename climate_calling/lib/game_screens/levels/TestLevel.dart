import 'dart:ui' as ui;

import 'package:climate_calling/controllers/sprites/Platform.dart';
import 'package:climate_calling/game_screens/levels/BaseLevel.dart';
import 'package:climate_calling/services/ImageCombiner.dart';
import 'package:climate_calling/services/MergeCombiner2.dart' as mc2;
import 'package:climate_calling/shared/constants.dart';
import 'package:flame/palette.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as image;
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';

class TestLevel extends BaseLevel {

  //Fields
  PaletteEntry _green = PaletteEntry(Colors.green);
  Size _size = Size(0, 0);
  List<Platform> platforms;

  //Constructor
  TestLevel() : super(250, 0, gravity: 0) {
    this.platforms = List();
    this._initPlatforms();
  }

  //Private methods
  Future<void> _initPlatforms() async{
    List<image.Image> images = List();
    for (int i=0; i<4; i++) {
      final ByteData assetImageByteData = await rootBundle.load(PATH_ARCTIC_TILE);
      image.Image img = image.decodeImage(assetImageByteData.buffer.asUint8List());
      images.add(img);
    }
    ImageCombiner combiner = ImageCombiner();

    for (image.Image img in images) {
      combiner.addImage(img);
    }
    
    image.Image combinedImage = combiner.getCombinedImage();
    ui.Codec codec = await ui.instantiateImageCodec(image.encodePng(combinedImage));
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    
    Platform plt = Platform.staticPlatform(frameInfo.image);

    plt.getAnimationComponent().x = 250;
    plt.getAnimationComponent().y = 250;

    this.platforms.add(plt);
    
  }

  //Overridden Methods
  @override
  bool isLevelFinished() {
    // TODO: implement isLevelFinished
    return false;
  }

  @override
  void onTapDown(TapDownDetails details, Function fn) {
    // TODO: implement onTapDown
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, this._size.width, this._size.height), this._green.paint);
    this.player.render(canvas);
    for (Platform plt in this.platforms) {
      plt.render(canvas);
    }
  }

  @override
  void resize(Size size) {
    this.player.resize(size);
    this._size = size;
    for (Platform plt in this.platforms) {
      plt.resize(size);
    }
  }

  @override
  void update(double t) async{
    this.player.update(t);
    this.player.applyGravity();
    // this.player.moveRight();
    // this.player.moveLeft();
    for (Platform plt in this.platforms) {
      plt.update(t);
    }
  }
}