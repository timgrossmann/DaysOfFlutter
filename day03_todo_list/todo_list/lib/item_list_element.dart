import 'package:flutter/material.dart';

import './todo_item.dart';

class TodoListEntry extends StatelessWidget {
  final TodoItem _todoItem;
  final Function _onDismissedFunc;
  final Function _switchDoneState;

  TodoListEntry(this._todoItem, this._onDismissedFunc, this._switchDoneState);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(Icons.delete),
          ),
        ),
        color: Colors.red[200],
      ),
      child: ListTile(
        title: Row(
          children: <Widget>[
            Checkbox(
              value: _todoItem.done,
              onChanged: _switchDoneState,
            ),
            Text(
              _todoItem.text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      onDismissed: _onDismissedFunc,
    );
  }
}
