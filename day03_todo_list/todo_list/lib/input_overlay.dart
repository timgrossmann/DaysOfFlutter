import 'package:flutter/material.dart';

class InputOverlay extends StatelessWidget {
  final bool _doDisplay;
  final Function _onSubmit;
  final _textController = TextEditingController();

  InputOverlay(this._doDisplay, this._onSubmit);

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _doDisplay
        ? Container(
            alignment: Alignment.topCenter,
            padding: new EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .25,
                right: 20.0,
                left: 20.0),
            child: new Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              child: new Card(
                child: Container(
                  margin: EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('What item do you want to add?'),
                      TextFormField(
                        autofocus: true,
                        controller: _textController,
                      ),
                      RaisedButton(
                        child: Text('Submit'),
                        onPressed: () => _onSubmit(_textController.text),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
                elevation: 4.0,
              ),
            ),
          )
        : Container();
  }
}
