import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? _token;
  String? _expiryDate;
  String? _userId;
  bool _userRegistered = false;

  Future<void> authenticate(
      String email, String password, String urlSegment) async {
    final url =
        "https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyC-nlF9wfjvIowhY6vM_AVetHRV5BeuM0I";

    final response = await http.post(Uri.parse(url),
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));

    print(json.decode(response.body));
  }

  Future<void> signIn(String email, String password) async {
    authenticate(email, password, 'signInWithPassword');
  }

  Future<void> signUp(String email, String password) async {
    authenticate(email, password, 'signUp');
  }
}
