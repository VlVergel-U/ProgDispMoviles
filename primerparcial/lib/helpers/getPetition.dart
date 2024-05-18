import 'package:dio/dio.dart';

class GetPetition {
  final _dio = Dio();

  Future getBebida() async {
    final response = await _dio
        .get('https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Vodka');

    return response.data;
  }

  Future getDescription(String bebidaID) async {
    final response = await _dio.get(
        'https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$bebidaID');

    return response.data;
  }
}
