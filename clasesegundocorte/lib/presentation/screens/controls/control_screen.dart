import 'package:flutter/material.dart';

class ControlScreen extends StatelessWidget {
  const ControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Controls"),
      ),
      body: const _ControlView(),
    );
  }
}

class _ControlView extends StatefulWidget {
  const _ControlView({
    super.key,
  });

  @override
  State<_ControlView> createState() => _ControlViewState();
}

enum Transporte { car, plane, boat, submarie }

class _ControlViewState extends State<_ControlView> {
  bool isMode = true;
  Transporte selectTrans = Transporte.car;
  bool desayuno = true;
  bool almuerzo = true;
  bool comida = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isMode,
          title: const Text('Mode'),
          subtitle: const Text("aditional"),
          onChanged: (values) {
            isMode = !isMode;
            setState(() {});
          },
        ),
        ExpansionTile(
          title: const Text('Vehiculo'),
          children: [
            RadioListTile(
              title: const Text('Carro'),
              value: Transporte.car,
              groupValue: selectTrans,
              onChanged: (values) {
                setState(() {
                  selectTrans = Transporte.car;
                });
              },
            ),
            RadioListTile(
              title: const Text('Bote'),
              value: Transporte.boat,
              groupValue: selectTrans,
              onChanged: (values) {
                setState(() {
                  selectTrans = Transporte.boat;
                });
              },
            ),
            RadioListTile(
              title: const Text('Avion'),
              value: Transporte.plane,
              groupValue: selectTrans,
              onChanged: (values) {
                setState(() {
                  selectTrans = Transporte.plane;
                });
              },
            ),
            RadioListTile(
              title: const Text('Submarine'),
              value: Transporte.submarie,
              groupValue: selectTrans,
              onChanged: (values) {
                setState(() {
                  selectTrans = Transporte.submarie;
                });
              },
            )
          ],
        ),
        ExpansionTile(
          title: Text('Comida'),
          children: [
            CheckboxListTile(
                title: const Text('Desayuno'),
                value: desayuno,
                onChanged: (value) {
                  setState(() {
                    desayuno = !desayuno;
                  });
                }),
            CheckboxListTile(
                title: const Text('Almuerzo'),
                value: almuerzo,
                onChanged: (value) {
                  setState(() {
                    almuerzo = !almuerzo;
                  });
                }),
            CheckboxListTile(
                title: const Text('Comida'),
                value: comida,
                onChanged: (value) {
                  setState(() {
                    comida = !comida;
                  });
                }),
          ],
        )
      ],
    );
  }
}
