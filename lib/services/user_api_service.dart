import 'package:http/http.dart' as http;
import '../model/userModelClass.dart';
import '../utils/constants.dart';


class UserApiService {

  static Future<List<UsersModelClass>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(userApi));
      print(response.statusCode);
      if (response.statusCode == 200) {
        return usersModelClassFromJson(response.body);
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
