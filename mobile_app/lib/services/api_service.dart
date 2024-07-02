import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/archaeological_place.dart';

class ApiService {
  static const String baseUrl = 'https://api.example.com';

  static Future<List<ArchaeologicalPlace>?> fetchArchaeologicalPlaces() async {
    final response = await http.get(
      Uri.parse('$baseUrl/places'),
      headers: {
        'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
      },
    );

    if (response.statusCode == 200) {
      Iterable json = jsonDecode(response.body);
      return json.map((place) => ArchaeologicalPlace.fromJson(place)).toList();
    } else {
      throw Exception('Failed to load places');
    }
  }

  static Future<bool> createArchaeologicalPlace(ArchaeologicalPlace place) async {
    final response = await http.post(
      Uri.parse('$baseUrl/places'),
      headers: {
        'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(place.toJson()),
    );

    return response.statusCode == 201;
  }

  static Future<bool> updateArchaeologicalPlace(ArchaeologicalPlace place) async {
    final response = await http.put(
      Uri.parse('$baseUrl/places/${place.id}'),
      headers: {
        'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(place.toJson()),
    );

    return response.statusCode == 200;
  }

  static Future<bool> deleteArchaeologicalPlace(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/places/$id'),
      headers: {
        'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
      },
    );

    return response.statusCode == 204;
  }
}
