import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackScreen extends StatelessWidget {
  const SnackScreen({super.key});

  void ShowCustomSnackBar(context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("goal"),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {},
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SnackBar"),
      ),
      body: _SnackView(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ShowCustomSnackBar(context);
        },
        label: Text("Mostrar"),
        icon: Icon(Icons.search),
      ),
    );
  }
}

class _SnackView extends StatelessWidget {
  const _SnackView({
    super.key,
  });

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // bloquea que cierre el dialogo,
      builder: (context) {
        return AlertDialog(
          title: const Text('Titutlo'),
          content: const Text('Contenido del dialogo'),
          actions: [
            TextButton(
                onPressed: () => context.pop(), child: const Text('Aceptar')),
            FilledButton(
                onPressed: () => context.pop(), child: const Text('Cancelar'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        FilledButton(
          onPressed: () {
            showAboutDialog(
              applicationName: "Nombre",
              context: context,
              children: [
                Text("esto es n dialogo"),
              ],
            );
          },
          child: Text("licencias"),
        ),
        FilledButton(
          onPressed: () {
            openDialog(context);
          },
          child: Text("Otro texto"),
        ),
      ],
    ));
  }
}
