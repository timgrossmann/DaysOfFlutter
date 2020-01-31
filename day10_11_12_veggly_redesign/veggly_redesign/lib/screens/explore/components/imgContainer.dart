import 'package:flutter/material.dart';
import 'package:veggly_redesign/components/userImgHero.dart';
import 'package:veggly_redesign/config/layout.dart';

class ImageContainer extends StatelessWidget {
  final String _imgSrc;

  ImageContainer(this._imgSrc);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          LayoutConfig.exploreImgBorderRadius,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: LayoutConfig.exploreDropShadowBlurRadius,
            spreadRadius: LayoutConfig.exploreDropShadowSpreadRadius,
          )
        ],
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.all(
              Radius.circular(LayoutConfig.exploreImgBorderRadius)),
          child: UserImageHero(_imgSrc)),
    );
  }
}
