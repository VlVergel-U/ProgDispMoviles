import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  static const String name = 'formularo';
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  Map<String, String> objeto = {'correo': '', 'pass': ''};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulariso'),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: "Correo"),
                  onChanged: (value) {
                    objeto["correo"] = value;
                    setState(() {});
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese el texto';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("procesndao data")));
                      }
                    },
                    child: const Text('submit')),
                FilledButton(
                  onPressed: () {
                    print(_formKey.toString());
                    // emailController.text = '';
                    // setState(() {});
                  },
                  child: const Text('Enviar'),
                ),
                Text(objeto["correo"].toString())
              ],
            ),
          )),
    );
  }
}
