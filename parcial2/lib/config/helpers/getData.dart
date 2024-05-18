import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:parcial2/config/models/tr'
    'ack_model.dart';

class GetData {

  final Dio _dio = Dio();
  final clientId = dotenv.env['SPOTIFY_CLIENT_ID'];
  final clientSecret = dotenv.env['SPOTIFY_CLIENT_SECRET'];
  final playlistId = dotenv.env['PLAYLIST_ID'];

  Future<String> getAccessToken() async {

    final response = await _dio.post(
      'https://accounts.spotify.com/api/token',
      options: Options(headers: {
        'Authorization': 'Basic ' + base64Encode(utf8.encode('$clientId:$clientSecret')),
        'Content-Type': 'application/x-www-form-urlencoded',
      }),
      data: {
        'grant_type': 'client_credentials',
      },
    );

    if (response.statusCode == 200) {
      return response.data['access_token'];
    } else {
      print('Failed to obtain access token: ${response.data}');
      throw Exception('Failed to obtain access token');
    }
  }

  Future<dynamic> getTracks(String accessToken) async {

    final response = await _dio.get(
      'https://api.spotify.com/v1/playlists/$playlistId/tracks',
      options: Options(headers: {
        'Authorization': 'Bearer $accessToken',
      }),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['items'];
      final List<Track> tracks = data.map((track) {
        final nombre = track['track']['name'].toString();
        final imagen = track['track']['album']['images'][0]['url'].toString();
        final artista = track['track']['artists'][0]['name'].toString();
        return Track(title: nombre, img: imagen, artist: artista);
      }).toList();
      return tracks;
    } else {
      print('Failed to fetch playlist tracks: ${response.data}');
      throw Exception('Failed to fetch playlist tracks');
    }
  }
  }

