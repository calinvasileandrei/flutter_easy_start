import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easy_start/core/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

class AuthRepository {
  Map<String, String> headers = {'Content-Type': 'application/json'};

  Future<User> authenticate({
    @required String email,
    @required String password,
  }) async {
    var body={
      'email':email,
      'password':password
    };

    try {
      final authResponse = await http.post(
          DotEnv.env["BACKEND_URL"] + "api/authenticate",
          headers: headers,
          body: json.encode(body));

      if (authResponse.statusCode == 200) {
        Map<String,dynamic> bodyParsed = json.decode(authResponse.body);
        return User.fromMapAPI(bodyParsed['user'],bodyParsed['id_token']);
      }
    } catch (err) {
      return null;
    }
    return null;
  }

  Future<void> deleteUser() async {
    /// delete from keystore/keychain
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    return;
  }

  Future<void> persistUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', user.toJson());
    return;
  }

  Future<User> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userRaw =prefs.getString('user');
    if(userRaw != null){
      return User.fromJson(userRaw);
    }

    return null;
  }
}
