import 'package:flutter/material.dart';

class UserProfileImgClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, size.height * 0.85);

    Offset controlPoint = Offset(size.width / 2, size.height * 1.0);
    Offset endPoint = Offset(size.width, size.height * 0.85);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
