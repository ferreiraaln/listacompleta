import 'package:flutter/material.dart';

import 'package:listacompleta/models/Item.dart';
import 'package:listacompleta/ui/add_item.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Item> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de compras"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.purple[100],
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          Icon icheck = Icon(
            Icons.done_all,
            color: Colors.blue,
          );

          Icon acheck = Icon(
            Icons.done,
            color: Colors.white,
          );

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple,
              child: IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: (item.isDone) ? icheck : acheck),
            ),
            title: Text(
              item.title,
              style: TextStyle(color: Colors.purple[300]),
            ),
            onTap: () {
              _refreshCheck(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[300],
        child: Icon(Icons.add),
        onPressed: _addItem,
      ),
    );
  }

  void _addItem() async {
    final item = await showDialog<Item>(
      builder: (context) => new AddItem(),
      context: context,
    );

    setState(() {
      items.add(item);
    });
  }

  Future<void> _refreshCheck(index) {
    setState(() {
      items[index].isDone = !items[index].isDone;
      items.sort((a, b) {
        if (a.isDone && !b.isDone)
          return 1;
        else if (!a.isDone && b.isDone) return -1;
        return 0;
      });
    });

    return Future.value();
  }
}
