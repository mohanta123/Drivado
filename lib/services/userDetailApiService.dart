import 'package:http/http.dart' as http;
import '../model/userDetailsModelClass.dart';
import '../utils/constants.dart';

class UserDetailsApiService {
  static const String url = userDetailsApi;

  static Future<UserDetailsModelClass> fetchUserDetails(String userId) async {
    try {
      final response = await http.get(Uri.parse(url+userId));
      print(response.statusCode);

      if (response.statusCode == 200) {
        return userDetailsModelClassFromJson(response.body);
      } else {
        throw Exception('Failed to load user details');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

