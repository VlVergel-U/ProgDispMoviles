import 'package:appractica/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //VARIABLES
  bool condicional = false;
  bool entrar = false;
  TextEditingController _password = TextEditingController();
  TextEditingController _user = TextEditingController();
  late String user;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zona Gamer'),
        leading: Icon(Icons.gamepad),
      ),
      body: Cuerpo(context),
      backgroundColor: Colors.red,
    );
  }

  Widget Cuerpo(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                NetworkImage("https://cdn.ipadizate.com/2021/04/IMG_1444.png?"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: ListView(
          children: [
            LoginTittle(),
            Center(
              child: LoginCampoUser(),
            ),
            Center(
              child: LoginCampoPassword(),
            ),
            Center(
              child: LoginBoton(context),
            ),
            Center(
              child: AlertBoton(context),
            ),
            Center(
              child: Text(
                condicional ? 'Si' : 'No',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ), //Si el resultado es true da Si sino entonces No
            ),
          ],
        ));
  }

  Widget LoginTittle() {
    return Container(
      padding: EdgeInsets.only(top: 50.0, bottom: 16.0),
      child: const Text(
        'Sign in',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget LoginCampoUser() {
    return Container(
      padding:
          EdgeInsets.only(top: 16.0, bottom: 16.0, left: 10.0, right: 10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "User",
          fillColor: Colors.white,
          filled: true,
        ),
        controller: _user,
      ),
    );
  }

  Widget LoginCampoPassword() {
    return Container(
      padding:
          EdgeInsets.only(top: 16.0, bottom: 16.0, left: 10.0, right: 10.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Password",
          fillColor: Colors.white,
          filled: true,
        ),
        controller: _password,
      ),
    );
  }

  Widget LoginBoton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        comprobarCredenciales(); // Se comprueba que el usuario y contraseña sean los establecidos
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
      child: Text('Entrar'),
    );
  }

  Widget AlertBoton(BuildContext context) {
    return TextButton(
        onPressed: () {
          _alert(context);
        },
        child: Text('He olvidado mi contraseña'));
  }

//La propiedad actions en Flutter se utiliza
//para definir una lista de widgets que representan
// acciones, botones, iconos, u otros widgets interactivos
// que el usuario puede utilizar para realizar acciones
// específicas relacionadas con la pantalla actual.

  void _alert(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      //cuando se pone false significa que el diálogo no se puede quitar presionando fuera de él
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Text(
                'Olvidó su contraseña',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Icon(Icons.crisis_alert, color: Colors.red),
            ],
          ),
          content: Text('¿Deseas cambiar tu contraseña?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    condicional = true;
                  });
                },
                child: Text('Sí')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    condicional = false;
                  });
                },
                child: Text('No'))
          ],
        );
      },
    );
  }

//Cuando llamas a showDialog, el BuildContext
// que pasas como argumento se utiliza para determinar
// dónde se debe mostrar el diálogo en la jerarquía de widgets.
// Sin embargo, dentro de la función builder, se espera un nuevo
// BuildContext que representa el contexto del widget que está
// construyendo el diálogo. Esto es necesario para que los widgets
// dentro del diálogo puedan acceder a su propio BuildContext local.

  void comprobarCredenciales() {
    user = _user.text;
    password = _password.text;

    if (user == 'Vale' && password == '123') {
      entrar = true;
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => home(user)), //pasamos la var por parámetro
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Inicio Sesión no válido'),
            content: Text('Usuario no registrado'),
          );
        },
      );
    }
  }
} // Clase Login
