import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;
  final String apiKey;

  ApiService(this.baseUrl, this.apiKey);

  Future<dynamic> get(String city, String endpoint) async {
    final finalUrl = '$baseUrl/$endpoint?q=$city&appid=$apiKey';
    final response = await http.get(Uri.parse(finalUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
