import 'dart:convert';
import 'package:api_test/config/config.dart';
import 'package:http/http.dart' as http;

import '../model/users.dart';

class ApiService {
  Future<List<Users>?> getUsers() async {
    var url = Uri.parse('${baseUrl}users');
    print(url);

    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((user) => Users.fromJson(user)).toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }
}