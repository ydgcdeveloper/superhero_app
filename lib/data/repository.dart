import 'dart:convert';

import 'package:superhero_app/data/model/superhero_search_response.dart';
import 'package:http/http.dart' as http;

final String token = 'f325b63ef45c8bf9c67c97ed8c5849af';

class Repository {
  Future<SuperheroSearchResponse> fetchSuperheroInfo(String name) async {
    final response = await http.get(
      Uri.parse('https://superheroapi.com/api/$token/search/$name'),
    );

    if (response.statusCode == 200) {
      return SuperheroSearchResponse.fromJson(jsonDecode(response.body));
    } else {
      return Future.error(
        'Failed to load superhero info: ${response.statusCode}',
      );
    }
  }
}
