import 'package:flutter_easy_start/core/models/user.dart';
import 'package:flutter_easy_start/core/repositories/response_message/response_message.dart';
import 'package:flutter_easy_start/core/repositories/response_message/response_message_status.dart';
import 'package:flutter_easy_start/core/repositories/send_request/send_request.dart';
import 'package:flutter_easy_start/core/repositories/send_request/send_request_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthRepository {

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
            return User.fromMapAPI(bodyParsed!['user'],bodyParsed['id_token']);
          },
      },
      messages: {
        ResponseMessageStatus.s200: 'OK',
        ResponseMessageStatus.s401: 'Credenziali Errate',
      }
    );
  }

  static deleteUser() async {
    /// delete from keystore/keychain
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
  }

  static persistUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', user.toJson());
  }

  static Future<User?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userRaw =prefs.getString('user');
    if(userRaw != null){
      return User.fromJson(userRaw);
    }

    return null;
  }
}
