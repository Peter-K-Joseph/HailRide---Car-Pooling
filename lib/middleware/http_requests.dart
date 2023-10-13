import 'package:http/http.dart' as http;
import 'package:hailride/model/constants.dart';

class HttpRequests {
  Future<int> login(String email, String password) async {
    http.Response res = await http.post(
      Uri.parse('${Constants().backendUrl}/auth/login'),
      body: {
        'email': email,
        'password': password,
      },
    );
    return res.statusCode;
  }
}
