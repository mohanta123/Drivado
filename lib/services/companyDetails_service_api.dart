import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/companyDetailsModelClass.dart';
import '../utils/constants.dart';

class CompanyDetailsApiService {
  static const String url = companyDetailsApi;

  static Future<CompanyDetailsModelClass> fetchCompanyDetails(String companyId) async {
    try {
      final response = await http.get(Uri.parse(url + companyId));
      print(response.statusCode);

      if (response.statusCode == 200) {
        // Parse the response body into the model
        return CompanyDetailsModelClass.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load company details');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
