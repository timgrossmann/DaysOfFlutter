import 'package:flutter/material.dart';
import 'package:homecare_ui_concept/data/occupations.dart';
import 'package:homecare_ui_concept/data/persons.dart';
import 'package:homecare_ui_concept/widgets/header_section.dart';
import 'package:homecare_ui_concept/widgets/occupation_card.dart';
import 'package:homecare_ui_concept/widgets/person_card.dart';

void main() => runApp(HomeCareApp());

class HomeCareApp extends StatefulWidget {
  @override
  _HomeCareAppState createState() => _HomeCareAppState();
}

class _HomeCareAppState extends State<HomeCareApp> {
  int _selectedOccupation = 1;
  List<Map<String, String>> _selectedPersons = persons[personsOccupationMapping[1]];

  void _onSelectOccupation(int occupation) {
    setState(() {
      _selectedOccupation = occupation;
      _selectedPersons = persons[personsOccupationMapping[occupation]];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(255, 119, 61, 1.0),
        accentColor: Color.fromRGBO(17, 188, 141, 1.0),
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
                radius: 5.0,
                colors: [Color.fromRGBO(34, 42, 56, 1.0), Color.fromRGBO(20, 20, 20, 1.0)]),
          ),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  HeaderSection(),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 40.0,
                    ),
                    child: Text(
                      'Find talent',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.75),
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: occupations.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: OccupationCard(
                                index,
                                occupations[index],
                                _onSelectOccupation,
                                (index == _selectedOccupation)));
                      },
                    ),
                  ),
                  Container(
                    height: 350,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
