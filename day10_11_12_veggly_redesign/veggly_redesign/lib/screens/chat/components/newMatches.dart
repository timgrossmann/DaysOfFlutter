import 'package:flutter/material.dart';
import 'package:veggly_redesign/data/users.dart';

class NewMatchesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'New Matches',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: 75.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: matchedUsers.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () => {},
                    child: Container(
                      margin: EdgeInsets.only(right: 15.0),
                      width: 75.0,
                      height: 75.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(matchedUsers[index].imgUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
