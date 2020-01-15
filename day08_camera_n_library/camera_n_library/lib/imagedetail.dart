import 'dart:io';

import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  final _imagePath;

  ImageDetail(this._imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          child: Image.file(
            File(_imagePath),
          ),
        ),
      ),
    );
  }
}
