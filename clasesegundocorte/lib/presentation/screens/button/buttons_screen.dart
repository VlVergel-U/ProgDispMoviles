import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'button_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Screen"),
      ),
      body: _ButtonView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: Icon(Icons.arrow_back_ios),
      ),
    );
  }
}

class _ButtonView extends StatelessWidget {
  const _ButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Wrap(
          spacing: 3.0,
          runSpacing: 3.0,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('Elevated Button')),
            const ElevatedButton(
                onPressed: null, child: Text('Elevated Button')),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.abc),
              label: const Text("Con icono"),
            ),
            FilledButton(onPressed: () {}, child: const Text("Relleno")),
            FilledButton.icon(
              onPressed: () {},
              icon: Icon(Icons.access_alarm_sharp),
              label: const Text("Relleno"),
            ),
            OutlinedButton(onPressed: () {}, child: Text("hika")),
            OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.account_balance_wallet),
                label: const Text("outline")),
            TextButton(onPressed: () {}, child: Text("gla")),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.account_balance_wallet),
                label: const Text("outline")),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.dangerous),
            ),
          ],
        ),
      ),
    );
  }
}
