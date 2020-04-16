import 'package:flutter/material.dart';
import 'package:si_calulator/data/data.dart';

class SimpleImage extends StatelessWidget {
  const SimpleImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage(Data.image);
    Image image = Image(
      image: assetImage,
      width: 130.0,
      height: 130.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(10.0),
    );
  }
}