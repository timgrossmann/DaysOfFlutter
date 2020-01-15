import 'package:camera_n_library/gallery.dart';
import 'package:flutter/material.dart';

void main() => runApp(GalleryCameraApp());

class GalleryCameraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Gallery(),
    );
  }
}
