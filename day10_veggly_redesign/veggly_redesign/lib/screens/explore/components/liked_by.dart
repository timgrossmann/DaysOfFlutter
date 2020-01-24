import 'package:flutter/material.dart';

class LikedBy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.cloud_circle),
          onPressed: () => {},
          color: Colors.black87,
        ),
        Text('People liked you'),
      ],
    );
  }
}
