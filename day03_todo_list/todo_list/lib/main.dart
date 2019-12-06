import 'package:flutter/material.dart';

import './item_list_element.dart';
import './input_overlay.dart';
import './todo_item.dart';
import './tutorial_overlay.dart';

void main() => runApp(TodoList());

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool _displayTutorial = true;
  List<TodoItem> _items =
      List<TodoItem>.generate(3, (i) => TodoItem('Day of Dart $i', true));
  bool _addItemOverlay = false;

  void _changeInputOverlay(bool state) {
    setState(() {
      _addItemOverlay = state;
    });
  }

  void _addItem(String text) {
    setState(() {
      _items = [..._items, TodoItem(text)];
    });
  }

  void _removeItem(TodoItem item) {
    setState(() {
      _items = _items.where((currItem) => currItem != item).toList();
    });
  }

  void _setDoneState(TodoItem item, bool state) {
    item.done = state;

    // seems to be a very dirty way of
    // retriggering state changes
    setState(() {
      _items = _items;
    });
  }

  void _hideTutorialOverlay() {
    setState(() {
      _displayTutorial = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo App'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _changeInputOverlay(true),
        ),
        body: Stack(
          children: <Widget>[
            ListView.builder(
              itemBuilder: ((context, index) => TodoListEntry(
                  _items[index],
                  (direction) => {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Removed item ${_items[index]}'),
                          ),
                        ),
                        _removeItem(_items[index]),
                      },
                  (state) => _setDoneState(_items[index], state))),
              itemCount: _items.length,
            ),
            InputOverlay(
              _addItemOverlay,
              (elem) => {_changeInputOverlay(false), _addItem(elem)},
            ),
            TutorialOverlay(_displayTutorial, _hideTutorialOverlay),
          ],
        ),
      ),
    );
  }
}
