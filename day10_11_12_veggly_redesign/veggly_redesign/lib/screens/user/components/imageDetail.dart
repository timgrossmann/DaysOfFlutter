import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  final _userImg;

  ImageDetail(this._userImg);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          child: Image(
            image: AssetImage(_userImg),
          ),
        ),
      ),
    );
  }
}
