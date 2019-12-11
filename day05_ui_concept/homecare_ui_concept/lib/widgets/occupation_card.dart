import 'package:flutter/material.dart';
import 'package:homecare_ui_concept/util.dart';
import 'package:icon_shadow/icon_shadow.dart';

class OccupationCard extends StatelessWidget {
  final int _widgetIndex;
  final Map<String, String> _occupation;
  final bool _expanded;
  final Function _onSelectWidget;

  OccupationCard(this._widgetIndex, this._occupation, this._onSelectWidget,
      [this._expanded = false]);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onSelectWidget(_widgetIndex),
      child: Align(
        alignment: Alignment.topCenter,
        child: _expanded
            ? _ExpandedOccupationCard(_occupation)
            : _CollapsedOccupationCard(_occupation),
      ),
    );
  }
}

class _ExpandedOccupationCard extends StatelessWidget {
  final Map<String, String> _occupation;

  _ExpandedOccupationCard(this._occupation);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.white60, blurRadius: 6.0, spreadRadius: 1.0)
        ],
      ),
      height: 160.0,
      width: 160.0,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconShadowWidget(
                Icon(
                  Icons.donut_large,
                  color: getColorFor(_occupation['color']),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                _occupation['title'],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(34, 42, 56, 1.0),
                  fontSize: 22,
                ),
              ),
            ],
          ),
          Row(children: <Widget>[
            Container(
              child: Text(
                _occupation['amount'],
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 50,
              child: Text(
                'TALENT FOUND',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                ),
              ),
            ),
          ]),
          Text(
            'around you',
            style: TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}

class _CollapsedOccupationCard extends StatelessWidget {
  final Map<String, String> _occupation;

  _CollapsedOccupationCard(this._occupation);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 100.0,
      width: 150.0,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.donut_large,
            size: 20.0,
            color: getColorFor(_occupation['color']),
          ),
          Text(
            _occupation['title'],
            style: TextStyle(
              color: Color.fromRGBO(34, 42, 56, 1.0),
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
