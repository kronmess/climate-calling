import 'dart:ui';

import 'package:flutter/painting.dart';
import 'package:merge_images/merge_images.dart';

class ImageCombiner {
  //Fields
  List<Image> imageList;

  ImageCombiner(List<Image> imageList) {
    this.imageList = imageList;
  }

  Future<Image> getMergedImage() async {
    return await ImagesMergeHelper.margeImages(imageList, direction: Axis.horizontal);
  }
}