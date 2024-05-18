import 'package:appractica/screens/homeScreens/socialScreens/chatUsuario.dart';
import 'package:flutter/material.dart';

class social extends StatelessWidget {
  final String user;

  const social(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: chat());
  }
}

Widget chat() {
  List<String> listaImg = [
    'https://i.pinimg.com/originals/5c/8f/e4/5c8fe49d0218d0f35706df1459ddf25e.jpg',
    'https://64.media.tumblr.com/dff7fbebf9a5e578d8a21680df08d9af/9ce8860dee646b0a-f9/s1280x1920/106745e95ebfeab0d94c941a2d9f3e0572f0ca34.png',
    'https://i.pinimg.com/originals/a4/2f/b1/a42fb1abb9a76e445fccaeba975b18d3.jpg'
  ];
  List<String> listaUsuarios = ['María', 'Juan', 'Pedrito'];
  List<String> listaMensajes = ['Hola', 'Juguemos', 'Un valo?'];
  List<String> listaHoras = ['9:29', '10:20', '8:00'];

  return ListView.builder(
    itemCount: listaUsuarios.length,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image(
            image: NetworkImage(listaImg[index]),
            width: 50,
            height: 50,
          ),
        ),
        title: Text(
          listaUsuarios[index],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(listaMensajes[index]),
        trailing: Text(listaHoras[index]),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => chatUsuario(
                  listaUsuarios[index], listaImg[index], listaMensajes[index]),
            ),
          );
        },
      );
    },
  );
}
