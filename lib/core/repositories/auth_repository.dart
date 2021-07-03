import 'package:flutter/material.dart';
import 'package:flutter_easy_start/core/models/user.dart';
import 'package:flutter_easy_start/core/repositories/response_message/response_message.dart';
import 'package:flutter_easy_start/core/repositories/send_request/send_request.dart';
import 'package:flutter_easy_start/core/repositories/send_request/send_request_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  Map<String, String> headers = {'Content-Type': 'application/json'};

  Future<ResponseMessage<User>> authenticate({
    @required String email,
    @required String password,
  }) async {

    ResponseMessage<User> response = await SendRequests.send(
      method: SendRequestsMethods.POST,
      endpoint: "api/authenticate",
      body: {
        'email':email,
        'password':password
      },
      onSuccessBody: (bodyParsed){
        return User.fromMapAPI(bodyParsed['user'],bodyParsed['id_token']);
      }
    );
    return response;
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
