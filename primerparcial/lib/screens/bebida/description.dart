import 'package:flutter/material.dart';

import '../../helpers/getPetition.dart';

class description extends StatefulWidget {
  const description({super.key, required this.ID_Descripcion});
  final String ID_Descripcion;
  @override
  State<description> createState() => _descriptionState();
}

class _descriptionState extends State<description> {
  final GetPetition petition = GetPetition();
  dynamic recetasDescripciones;

  void getData() async {
    var response = await petition.getDescription(widget.ID_Descripcion);
    setState(() {
      recetasDescripciones = response["drinks"][0];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recetasDescripciones != null
            ? recetasDescripciones["strDrink"]
            : "Cargando..."),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: [
          if (recetasDescripciones != null) ...[
            SizedBox(height: 12),
            Container(
              width: 100, // Establece el ancho deseado
              height: 100, // Establece la altura deseada
              child: Image(
                image: NetworkImage(recetasDescripciones["strDrinkThumb"]),
                fit: BoxFit.contain, // Prueba con BoxFit.contain
              ),
            ),
            SizedBox(height: 12),
            Divider(),
            Text(
              'Descripción: ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              '${recetasDescripciones["strInstructions"]}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            Divider(),
            SizedBox(height: 12),
            Text(
              'Categoría: ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              '${recetasDescripciones["strCategory"]}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            Divider(),
            SizedBox(height: 12),
            Text(
              'Vidrio: ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              '${recetasDescripciones["strGlass"]}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            Divider(),
            SizedBox(height: 12),
            Text(
              'Alcohol: ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              '${recetasDescripciones["strAlcoholic"]}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            Divider(),
            SizedBox(height: 12),
            Text(
              'Ingrediente 1: ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              '${recetasDescripciones["strIngredient1"]}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            Divider(),
            SizedBox(height: 12),
            Text(
              'Ingrediente 2: ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              '${recetasDescripciones["strIngredient2"]}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            Divider(),
          ],
        ],
      ),
    );
  }
}
