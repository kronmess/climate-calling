import 'dart:math';

import 'package:image/image.dart';

class ImageCombiner {
  //Fields
  List<Image> images;

  //Constructors
  ImageCombiner({Image initialImage}) {
    this.images = List();
    if (initialImage != null) this.addImage(initialImage);
  }
  ImageCombiner.fromList(List<Image> images) {
    this.images = List();
    for (Image img in images) {
      this.addImage(img);
    }
  }

  //Public Methods
  void addImage(Image img) {
    this.images.add(img);
  }

  Image getCombinedImage() {
    int width = 0;
    int height = 0;
    for (Image img in images) {
      width += img.width;
      height = max(height, img.height);
    }
    
    final Image mergedImage = Image(width, height);
    //Reset width
    width = 0;
    for (Image img in images) {
      copyInto(mergedImage, img, dstX: width, blend: false);
      width += img.width;
    }

    return mergedImage;
  }
}