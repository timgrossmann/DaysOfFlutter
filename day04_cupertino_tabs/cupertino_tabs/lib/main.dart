import 'package:flutter/cupertino.dart';

void main() => runApp(CupertinoTabsApp());

class CupertinoTabsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          navLargeTitleTextStyle: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 40.0,
            color: CupertinoColors.activeBlue,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Home Screen'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            title: Text('Search Screen'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            title: Text('Settings Screen'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            String text = (index == 0)
                    ? 'Home'
                    : (index == 1) ? 'Search' : 'Settings';

            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text(text),
              ),
              child: Center(
                child: CupertinoButton(
                  child: Text(
                    'Page $text',
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .navLargeTitleTextStyle,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (context) {
                      return DetailsScreen();
                    }));
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _selection = -1;
  bool _switchActive = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Details'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Activate'),
                  ),
                  CupertinoSwitch(
                    value: _switchActive,
                    onChanged: (value) => setState(() => {
                      _switchActive = value
                    }),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            CupertinoButton(
              color: CupertinoColors.activeBlue,
              child: (_selection == -1)
                  ? Text('Launch Selection')
                  : Text('Selected $_selection'),
              onPressed: () {
                showCupertinoModalPopup<int>(
                    context: context,
                    builder: (context) {
                      return CupertinoActionSheet(
                        title: Text('Choices'),
                        actions: <Widget>[
                          CupertinoActionSheetAction(
                            child: Text('Choice 1'),
                            onPressed: () {
                              Navigator.pop(context, 1);
                            },
                            isDefaultAction: true,
                          ),
                          CupertinoActionSheetAction(
                            child: Text('Choice 2'),
                            onPressed: () {
                              Navigator.pop(context, 2);
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: Text('Choice 3'),
                            onPressed: () {
                              Navigator.pop(context, 3);
                            },
                          ),
                        ],
                      );
                    }).then((value) {
                  setState(() {
                    _selection = value;
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
