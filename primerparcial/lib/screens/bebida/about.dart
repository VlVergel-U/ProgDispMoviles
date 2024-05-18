import 'package:flutter/material.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Text(
          '¡Bienvenido a la Coctelería!\n\n'
          'Estamos encantados de recibirte en nuestro acogedor espacio dedicado a los amantes de los cócteles. En nuestra coctelería, te invitamos a disfrutar de una experiencia única donde podrás explorar una amplia variedad de bebidas exquisitas y creativas.\n\n'
          'Adéntrate en nuestro menú y descubre una selección cuidadosamente curada de cócteles clásicos y contemporáneos.\n',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
