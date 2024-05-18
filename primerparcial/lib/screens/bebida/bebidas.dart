import 'package:flutter/material.dart';
import 'package:primerparcial/screens/bebida/description.dart';

import '../../helpers/getPetition.dart';

class bebidas extends StatefulWidget {
  const bebidas({super.key});

  @override
  State<bebidas> createState() => _bebidasState();
}

class _bebidasState extends State<bebidas> {
  final GetPetition petition = GetPetition();
  dynamic recetas = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var response = await petition.getBebida();
    setState(() {
      recetas = response["drinks"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: recetas.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => description(
                    ID_Descripcion: recetas[index]["idDrink"].toString(),
                  ),
                ),
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(recetas[index]["strDrinkThumb"]),
              ),
              title: Text(recetas[index]["strDrink"].toString()),
            ),
          );
        },
      ),
    );
  }
}
