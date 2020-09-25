import 'package:flutter/material.dart';
import 'package:listacompleta/models/Item.dart';

class AddItem extends StatelessWidget {
  final itemC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Novo Item'),
      content: TextField(
        autofocus: true,
        controller: itemC,
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("cancelar"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        FlatButton(
          child: Text("Adicionar"),
          onPressed: () {
            final item = new Item(title: itemC.value.text);
            itemC.clear();
            Navigator.of(context).pop(item);
          },
        )
      ],
    );
  }
}
