import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/menu/menu_items.dart';

class Menu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const Menu({super.key, required this.scaffoldKey});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });

          final menuItem = appMenuItems[value];
          context.push(menuItem.link);
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, hasNotch ? 10 : 20, 16, 10),
            child: const Text('Hola'),
          ),
          ...appMenuItems.map((res) => NavigationDrawerDestination(
                icon: Icon(res.icon),
                label: Text(res.title),
              )),
        ]);
  }
}
