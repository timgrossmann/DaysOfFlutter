import 'package:flutter/material.dart';
import 'package:veggly_redesign/config/layout.dart';

class UserImageHero extends StatelessWidget {
  final String _imgSrc;

  UserImageHero(this._imgSrc);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _imgSrc,
      child: Image(
        image: AssetImage(_imgSrc),
        height: MediaQuery.of(context).size.height *
            LayoutConfig.exploreImgHeightPerc,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
