import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';

void main() => runApp(TrivialItemList());

class TrivialItemList extends StatefulWidget {
  @override
  _TrivialItemListState createState() => _TrivialItemListState();
}

class _TrivialItemListState extends State<TrivialItemList> {
  List<String> _items = List<String>.generate(5, (i) => Uuid().v1());

  void _addItem() {
    setState(() {
      _items = [..._items, Uuid().v1()];
    });
  }

  Dismissible _buildDismissible(BuildContext context, int index, String item) {
    return Dismissible(
      key: Key('dis_$index$item'),
      background: Container(
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(Icons.delete),
          ),
        ),
        color: Colors.red,
      ),
      child: ListTile(
        title: Text(
          item,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      ),
      onDismissed: (direction) => {
        _items.remove(item),
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Item $item has been deleted'),
        )),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Trivial Item List'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _addItem,
        ),
        body: ListView.builder(
          itemBuilder: ((context, index) =>
              _buildDismissible(context, index, _items[index])),
          itemCount: _items.length,
        ),
      ),
    );
  }
}
