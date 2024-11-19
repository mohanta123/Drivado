import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/companyModelClass.dart';
import '../model/userModelClass.dart';
import '../utils/constants.dart';


class CompanyApiService {
  static const String url = companyApi;

  static Future<List<CompanyModelClass>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      print('Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse
            .map((data) => CompanyModelClass.fromJson(data))
            .toList();
      } else {
        throw Exception('Failed to load users. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error fetching users: $e');
    }
  }
}
