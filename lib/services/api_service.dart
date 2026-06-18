import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://10.0.2.2:8000/api";

  // Método para Login
  Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/login'),
      body: json.encode({'user': {'email': email, 'password': password}}),
      headers: {'Content-Type': 'application/json'},
    );
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['user']['token'];
    }
    return null;
  }

  // Método para listar lugares usando el token
  Future<List<dynamic>> fetchPlaces(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/places'),
      headers: {
        'Authorization': 'Token $token', 
        'Content-Type': 'application/json',
      },
    );
    
    if (response.statusCode == 200) {
      return json.decode(response.body)['places'];
    }
    throw Exception('Error al cargar lugares');
  }
}