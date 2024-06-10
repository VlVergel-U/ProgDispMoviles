import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frontend/config/models/track_model.dart';

class GetData {
  final Dio _dio = Dio();

  Future<List<Track>> getTracks() async {
    final response = await _dio.get('http://localhost:3000/getSongs');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      final List<Track> tracks = data.map((track) {
        final nombre = track['name'].toString();
        final imagen = track['img'].toString();
        final artista = track['artist']['artist_name'].toString();
        return Track(title: nombre, img: imagen, artist: artista);
      }).toList();
      return tracks;
    } else {
      print('Failed to fetch songs: ${response.data}');
      throw Exception('Failed to fetch songs');
    }
  }

  Future<Track> getTrack(BuildContext context, TextEditingController searchController) async {
      final options = Options(validateStatus: (status) => status != null && status < 500);
      final response = await _dio.get('http://localhost:3000/getSong/${searchController.text}', options: options);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        final nombre = data['name'].toString();
        final imagen = data['img'].toString();
        final artista = data['artist']['artist_name'].toString();
        return Track(title: nombre, img: imagen, artist: artista);
      } else if (response.statusCode == 404) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No encontrado')),
        );
        throw Exception('No encontrado');
      } else if (response.statusCode == 500) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error')),
        );
        throw Exception('Error');
      } else {
        // Otros códigos de estado que podrían ser manejados
        throw Exception('Código de estado desconocido: ${response.statusCode}');
      }
  }


}