import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:flutter_easy_start/core/repositories/response_message/response_message.dart';
import 'package:flutter_easy_start/core/repositories/response_message/response_message_status.dart';
import 'package:flutter_easy_start/core/repositories/send_request/send_request_methods.dart';
import 'package:http/http.dart' as http;


class SendRequests{
  static Map<String, String> defaultHeader = {'Content-Type': 'application/json'};

  static Future<ResponseMessage> send({
    SendRequestsMethods method,
    String endpoint,
    Map<String,dynamic> body,
    Map<String, String> customHeader,
    String parameter,
    Function onSuccessBody
  }) async {

    Map<String,String> header = _hasCustomHeaders(customHeader);
    String url = _generateUrl(endpoint, parameter);
    String bodyJson = json.encode(body);
    Function methodChosen = _choseMethod(method);

    return await _requestSender(methodChosen,url,header,bodyJson,onSuccessBody);
  }

  static Future<ResponseMessage> _requestSender(method,url,header,body,onSuccessBody) async{
    try {
      http.Response response = await method(url,header,body);
      if (response.statusCode == 200) {
        Map<String,dynamic> bodyParsed = json.decode(response.body);
        return new ResponseMessage(status: ResponseMessageStatus.s200,body: onSuccessBody(bodyParsed),message: "OK");
      }
      return new ResponseMessage(
          status: ResponseMessageStatusBinder.toStatus(response.statusCode),
          body: null,
          message: "Request produced a statusCode != 200 !"
      );
    } catch (err) {
      return new ResponseMessage(
          status: ResponseMessageStatus.s500,
          body: null,
          message: err.toString()
      );
    }
  }

  //HELPER METHODS

  static Map<String, String> _hasCustomHeaders(Map<String, String> header){
    if(header != null){
      return header;
    }
    return SendRequests.defaultHeader;
  }

  static String _generateUrl(String endponint,String parameter){
    String url = DotEnv.env["BACKEND_URL"] +"/"+endponint;
    if(parameter!=null && parameter.length >0){
      url += "/"+parameter;
    }
    return url;
  }


  //HTTP METHOD SELECTOR

  static Function _choseMethod(SendRequestsMethods method){
    switch(method){
      case SendRequestsMethods.GET:
        return _sendGet;
        break;
      case SendRequestsMethods.POST:
        return _sendPost;
        break;
      case SendRequestsMethods.PUT:
        return _sendPut;
        break;
      case SendRequestsMethods.DELETE:
        return _sendDelete;
        break;
    }
  }

  //HTTP METHODS

  static Future<http.Response> _sendGet(url,header,body) async{
    http.Response response = await http.get(url, headers: header);
    return response;
  }

  static Future<http.Response> _sendPost(url,header,body) async{
    http.Response response = await http.post(url, headers: header,body: body);
      return response;
  }

  static Future<http.Response> _sendPut(url,header,body) async{
    http.Response response = await http.put(url, headers: header,body: body);
    return response;
  }

  static Future<http.Response> _sendDelete(url,header,body) async{
    http.Response response = await http.delete(url, headers: header);
    return response;
  }


}
