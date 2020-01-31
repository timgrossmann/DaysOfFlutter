import 'package:flutter/material.dart';

class ExploreUserButtons extends StatelessWidget {
  final double _likeSize;
  final double _hideSize;
  final double _spacing;

  ExploreUserButtons({likeSize = 30.0, hideSize = 25.0, spacing = 15.0})
      : this._likeSize = likeSize,
        this._hideSize = hideSize,
        this._spacing = spacing;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 20.0,
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: _hideSize * 1.5,
            height: _hideSize * 1.5,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: IconButton(
              iconSize: _hideSize,
              icon: Icon(Icons.clear),
              color: Colors.white,
              onPressed: () => {},
            ),
          ),
          SizedBox(
            width: _spacing,
          ),
          Container(
            width: _likeSize * 1.5,
            height: _likeSize * 1.5,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: IconButton(
              iconSize: _likeSize,
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () => {},
            ),
          ),
        ],
      ),
    );
  }
}
