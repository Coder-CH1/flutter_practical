import 'dart:convert';
import 'package:assessment/auth_manager/auth_constant.dart';
import 'package:assessment/auth_manager/model.dart';
import 'package:http/http.dart' as http;

/// AUTHENTICATION IMPLEMENTATIONS
class AuthManager {
  late final http.Client client;

  AuthManager(this.client);

  /// LOGIN
  Future<Welcome> login(String email, String password) async{
    final response = await client.post(
      Uri.parse('${ApiConstant.baseUrl}user/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return Welcome.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login ${response.body}');
    }
  }

  /// SIGNUP
  Future<Welcome> signup(String firstName, String lastName, String phoneNumber, String email, String password, String dob) async {
    final response = await client.post(
      Uri.parse('${ApiConstant.baseUrl}user/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'email': email,
        'password': password,
        'dob': dob,
      }),
    );

    if (response.statusCode == 201) {
      return Welcome.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to signup ${response.body}');
    }
  }
}