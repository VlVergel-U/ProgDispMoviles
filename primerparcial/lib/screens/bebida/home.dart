import 'package:flutter/material.dart';
import 'package:primerparcial/screens/bebida/about.dart';
import 'package:primerparcial/screens/bebida/bebidas.dart';

import 'description.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _seleccion = 1;
  static final List<Map<String, dynamic>> _itemsMenuWidgets = [
    {'title': 'Bebidas', 'widget': const bebidas()},
    {'title': 'Home', 'widget': const about()}
  ];

  void seleccionar(int index) {
    setState(() {
      _seleccion = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cocktail'),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: _itemsMenuWidgets.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_itemsMenuWidgets[index]['title']),
              selected: _seleccion == index,
              onTap: () {
                seleccionar(index);
              },
            );
          },
        ),
      ),
      body: _itemsMenuWidgets[_seleccion]['widget'],
    );
  }
}
