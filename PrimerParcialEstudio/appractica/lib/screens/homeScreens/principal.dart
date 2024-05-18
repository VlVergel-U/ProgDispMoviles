import 'package:flutter/material.dart';

class principal extends StatelessWidget {
  final String user;

  const principal(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: Text(
              '¡Hola, $user !',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  fontSize: 26),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(25, 15, 5, 25),
            child: Text(
              '¡Bienvenido a nuestra aplicación!\n\n'
              'Estamos encantados de tenerte aquí. '
              'Esperamos que disfrutes de tu experiencia con nosotros.\n\n'
              'Nuestra aplicación ofrece una amplia gama de características y funcionalidades '
              'para satisfacer tus necesidades. Si tienes alguna pregunta o necesitas ayuda, '
              'no dudes en ponerte en contacto con nuestro equipo de soporte.\n\n'
              '¡Gracias por elegirnos!',
            ),
          ),
        ],
      ),
    );
  }
}
