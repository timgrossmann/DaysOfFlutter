import 'package:flutter/material.dart';

class UserProfileInfoRow extends StatelessWidget {
  final IconData _icon;
  final String _primaryInfo;
  final String _secondaryInfo;

  UserProfileInfoRow(this._icon, this._primaryInfo, this._secondaryInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            _icon,
            size: 40.0,
          ),
          SizedBox(
            width: 25.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Wrap(
              children: <Widget>[
                Text(
                  _primaryInfo,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  _secondaryInfo,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 15.0,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
