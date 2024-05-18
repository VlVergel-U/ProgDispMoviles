import 'package:flutter/material.dart';
import 'homeScreens/games.dart';
import 'homeScreens/principal.dart';
import 'homeScreens/social.dart';

class home extends StatefulWidget {
  final String user;

  const home(this.user, {super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  //Variables
  int _indexNavegacion = 0;
  late List<Widget> _paginas;

  //Se puede inicializar en el build pero se
  // reconstruiría cada vez que se guarda,
  // en cambio en el void initState sólo pasa
  // una vez en el ciclo de vida del programa

  @override
  void initState() {
    _paginas = [
      principal(widget.user),
      games(widget.user),
      social(widget.user),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: _paginas[_indexNavegacion],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexNavegacion,
        items: [
          BottomNavigationBarItem(
              //0
              icon: Icon(Icons.home),
              backgroundColor: Colors.blue,
              label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.games), label: 'Games'), //1
          BottomNavigationBarItem(
              //2
              icon: Icon(Icons.social_distance),
              label: 'Social')
        ],
        onTap: (index) {
          setState(() {
            _indexNavegacion = index;
          });
        },
      ),
    );
  }
} //Clase home
