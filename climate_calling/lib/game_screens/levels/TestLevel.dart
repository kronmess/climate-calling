import 'dart:ui' as ui;

import 'package:climate_calling/controllers/sprites/Platform.dart';
import 'package:climate_calling/game_screens/levels/BaseLevel.dart';
import 'package:climate_calling/services/ImageCombiner.dart';
import 'package:climate_calling/shared/constants.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/palette.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as image;
import 'package:flutter/material.dart';

class TestLevel extends BaseLevel {

  //Fields
  PaletteEntry _green = PaletteEntry(Colors.green);

  //Constructor
  TestLevel() : super(250, 0);

  //Overridden Methods
  Future<void> initPlatforms() async{
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

  @override
  bool isLevelFinished() {
    // TODO: implement isLevelFinished
    return false;
  }

  @override
  void onTapDown(TapDownDetails details, Function fn) {
    super.onTapDown(details, fn);
    // TODO: implement onTapDown
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, this.size.width, this.size.height), this._green.paint);
    super.render(canvas);
  }

  @override
  void update(double t) async{
    super.update(t);
    Rect playerRect = this.player.getAnimationComponent().toRect();
    for (Platform plt in this.platforms) {
      //Check for player collision with platform
      if (plt.overlaps(playerRect)) {
        AnimationComponent pAC = this.player.getAnimationComponent();
        AnimationComponent platAC = plt.getAnimationComponent();

        //Check for y overlap
        if (pAC.y + pAC.height >= platAC.y) {
          pAC.y = platAC.y - pAC.height;
          this.stopGravity = true;
        }
        else if (pAC.y <= platAC.y + platAC.height) {
          pAC.y = platAC.y + platAC.height;
        }
        else {
          //Check for x overlap
          if (pAC.x + pAC.width >= platAC.x) {
          pAC.x = platAC.x - pAC.width;
          }
          else if (pAC.x <= platAC.x + platAC.width) {
            pAC.x = platAC.x + platAC.width;
          }
        }
        break;
      }
    }
  }
}