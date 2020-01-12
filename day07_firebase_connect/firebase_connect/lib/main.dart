import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io' show Platform;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

void main() => runApp(FireBaseChatApp());

class FireBaseChatApp extends StatelessWidget {
  String _currUser = Platform.isIOS ? 'Tim' : 'Frank';
  String _currReceiver = Platform.isIOS ? 'Frank' : 'Tim';

  void _sendMessage(String message) {
    Firestore.instance
        .collection('messages')
        .document(new Uuid().v1())
        .setData({
      'from': _currUser,
      'to': _currReceiver,
      'message': message,
      'timestamp': Timestamp.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(
            vertical: 75.0,
            horizontal: 20.0,
          ),
          child: Column(children: <Widget>[
            Expanded(
              child: StreamBuilder(
                stream: Firestore.instance
                    .collection('messages')
                    .orderBy('timestamp')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text('Loading...');
                  }

                  return ListView.builder(
                    itemExtent: 80.0,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      String messageUser =
                          snapshot.data.documents[index]['from'];

                      return MessageWidget(snapshot.data.documents[index],
                          (messageUser != _currUser));
                    },
                  );
                },
              ),
            ),
            MessageSenderWidget(_sendMessage),
          ]),
        ),
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final DocumentSnapshot _message;
  final bool _received;

  MessageWidget(this._message, [this._received = false]);

  @override
  Widget build(BuildContext context) {
    String formattedDate = new DateFormat("dd-MM-yyyy hh:mm:ss")
        .format(_message['timestamp'].toDate());

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment:
            _received ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: _received ? Colors.blueAccent : Colors.amber,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, blurRadius: 5.0, spreadRadius: 0.5)
              ],
            ),
            width: 200.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _message['message'],
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      _message['from'].toString(),
                      style: TextStyle(fontSize: 10.0),
                    ),
                    Text(
                      formattedDate,
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageSenderWidget extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();
  final Function _onSubmit;

  MessageSenderWidget(this._onSubmit);

  void dispose() {
    // Clean up the controller when the widget is disposed.
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
            ),
          ),
          RaisedButton(
            child: Text('Press'),
            onPressed: () => {
              _onSubmit(_textController.text),
              _textController.clear(),
            },
          )
        ],
      ),
    );
  }
}
