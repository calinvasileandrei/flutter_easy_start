import 'package:flutter_easy_start/core/models/user.dart';
import 'package:flutter_easy_start/core/repositories/response_message/response_message.dart';
import 'package:flutter_easy_start/core/repositories/response_message/response_message_status.dart';
import 'package:flutter_easy_start/core/repositories/send_request/send_request.dart';
import 'package:flutter_easy_start/core/repositories/send_request/send_request_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

class AuthRepository {

  /// Authenticate method
  static Future<ResponseMessage<User?>> authenticate({
    required String? email,
    required String? password,
  }) async {
    SendRequests<User> request = new SendRequests(dotenv.env["BACKEND_URL"]!);

    return await request.send(
      method: SendRequestsMethods.POST,
      endpoint: "api/authenticate",
      body: {
        'email':email,
        'password':password
      },
      actions: {
          ResponseMessageStatus.s200: (Map<String,dynamic>? bodyParsed){
            return User.fromJsonWithToken(bodyParsed!['user'],bodyParsed['id_token']);
          },
      },
      messages: {
        ResponseMessageStatus.s200: 'OK',
        ResponseMessageStatus.s400: 'Inserire sia Email che Password!',
        ResponseMessageStatus.s401: 'Credenziali Errate',
      }
    );
  }

  /// delete User from Device Storage
  static deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
  }

  /// persist User inside the Device Storage
  static persistUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', json.encode(user.toJson()) );
  }

  /// get the User from the Device Storage
  static Future<User?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userRaw =prefs.getString('user');
    if(userRaw != null){
      return User.fromJson(json.decode(userRaw));
    }
    return null;
  }
}
