import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loginagain/model/user/user_model.dart';


/// The service responsible for networking requests
class UserApi {
  static const endpoint = 'https://jsonplaceholder.typicode.com';

  var client = new http.Client();

  Future<User> getUserProfile(int userId) async {
    // Get user profile for id
    var response = await client.get('$endpoint/users/$userId');

    // Convert and return
    return User.fromJson(json.decode(response.body));
  }

}
