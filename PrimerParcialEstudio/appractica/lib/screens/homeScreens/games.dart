import 'package:flutter/material.dart';

class games extends StatefulWidget {
  final String user;

  const games(this.user, {super.key});

  @override
  State<games> createState() => _gamesState();
}

class _gamesState extends State<games> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                print('Has seleccionado');
              },
              child: Image(
                image: NetworkImage(
                    'https://cdn.akamai.steamstatic.com/steam/apps/243470/capsule_616x353.jpg?'),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                print('Has seleccionado');
              },
              child: Image(
                image: NetworkImage(
                    'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2022/12/rayman-2911850.jpg?'),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                print('Has seleccionado');
              },
              child: Image(
                image: NetworkImage(
                    'https://esportsbureau.com/wp-content/uploads/2023/09/GTA-V.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
