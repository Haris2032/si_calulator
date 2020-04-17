import 'package:flutter/material.dart';
import 'package:si_calulator/data/data.dart';

class SimpleImage extends StatelessWidget {
  const SimpleImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage(Data.image);
    Image image = Image(
      image: assetImage,
      width: 180.0,
      height: 150.0,
    );
    return Container(
      child: image,
    );
  }
}