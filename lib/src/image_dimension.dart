import 'dart:async';

import 'package:flutter/material.dart';

Future<Size> _calculateImageDimension(String imgUrl) {
    Completer<Size> completer = Completer();
    Image image = Image(image: NetworkImage(imgUrl));

    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
          completer.complete(size);
        },
      ),
    );
    return completer.future;
  }