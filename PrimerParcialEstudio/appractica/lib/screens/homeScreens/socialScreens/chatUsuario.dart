import 'package:flutter/material.dart';

class chatUsuario extends StatefulWidget {
  final String user;
  final String img;
  final String msjUser;

  const chatUsuario(this.user, this.img, this.msjUser, {super.key});

  @override
  State<chatUsuario> createState() => _chatUsuarioState();
}

class _chatUsuarioState extends State<chatUsuario> {
  TextEditingController _msjNuevo = TextEditingController();
  List<String> mensajesMios = ["Hola", "Cómo vas"];
  List<String> mensajesMiosHoras = ["9:29", "9:30"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9E97EA),
        toolbarHeight: 75,
        title: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image(
              image: NetworkImage(widget.img),
              width: 48,
              height: 48,
            ),
          ),
          title: Text(
            widget.user,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Text(
            'Escribiendo...',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        actions: [
          IconButton(
            onPressed: botonPresionado,
            icon: Icon(Icons.call),
            color: Colors.deepPurple,
          ),
          IconButton(
            onPressed: botonPresionado,
            icon: Icon(Icons.video_camera_front),
            color: Colors.deepPurple,
          ),
        ],
      ),
      body: mensajes(),
      bottomSheet: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Escribe un mensaje",
                fillColor: Colors.white,
                filled: true,
              ),
              controller: _msjNuevo,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                mensajesMios.add(_msjNuevo.text);
                mensajesMiosHoras.add(_hora());
                _msjNuevo.clear();
              });
            },
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  Widget mensajes() {
    return ListView.builder(
      itemCount: mensajesMios.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
          child: IntrinsicWidth(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFFE4E4E6),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      Text(
                        mensajesMios[index],
                        style:
                            TextStyle(color: Color(0xFF3C3C3C), fontSize: 16),
                      ),
                      SizedBox(width: 6),
                      Text(
                        mensajesMiosHoras[index],
                        style:
                            TextStyle(color: Color(0xFF626262), fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

void botonPresionado() {
  print('Has presionado el botón');
}

String _hora() {
  DateTime actual = DateTime.now();
  String formatoHora = '${actual.hour}:${actual.minute}';
  return formatoHora;
}
