import 'dart:convert';
import 'package:flutter_easy_start/core/repositories/response_message/response_message.dart';
import 'package:flutter_easy_start/core/repositories/response_message/response_message_exception.dart';
import 'package:flutter_easy_start/core/repositories/response_message/response_message_status.dart';
import 'package:http/http.dart' as http;
import 'send_request_methods.dart';

class SendRequests<T> {
  static Map<String, String> defaultHeader = {
    'Content-Type': 'application/json'
  };
  String backendURL;

  SendRequests(this.backendURL);

  Future<ResponseMessage<T?>> send({
      required SendRequestsMethods method,
      required String endpoint,
      required Map<ResponseMessageStatus, T Function(Map<String, dynamic>)> actions,
      //TODO : implement use Server Messages
      Map<String, dynamic>? body,
      Map<String, String>? customHeader,
      String? parameter,
      Map<ResponseMessageStatus, String>? messages,
      String? authToken
      }) async {
    return await _requestSender(
        SendRequestMethodSelector.chose(method),
        _generateUrl(endpoint, parameter),
        actions,
        _generateHeader(customHeader,authToken),
        json.encode(body),
        messages);
  }

  /// Core method which makes the http request and returns a proper [ResponseMessage] with the defined statusCode:[ResponseMessageStatus] , body:[T], message from :[messages]
  Future<ResponseMessage<T>> _requestSender(
      Function method,
      String url,
      Map<ResponseMessageStatus, T Function(Map<String, dynamic>)> actions,
      Map<String, String> header,
      String body,
      Map<ResponseMessageStatus, String>? messages) async {
    try {
      // make the http request
      http.Response response = await method(url, header, body);

      // first check if the request has been successfully completed
      if (response.statusCode == 200) {
        // parse the response body
        Map<String, dynamic> bodyParsed = json.decode(response.body);
        // return a [ResponseMessage] with status 200 and in the body returns a [T] generated in the actions and the messages defined in the messages
        return ResponseMessage(
            status: ResponseMessageStatus.s200,
            body: actions[ResponseMessageStatus.s200]!(bodyParsed),
            message: getMessage(ResponseMessageStatus.s200, messages));
      }
      // if the status codes is different from 200 cycle on all the supported status codes and return a [ResponseMessage] with the defined body in the action and message
      for (var action in actions.entries) {
        if (response.statusCode == ResponseMessageStatusBinder.fromStatus(action.key)) {
          var bodyParsed = <String, dynamic>{};
          if (response.body.isNotEmpty) {
            bodyParsed = json.decode(response.body);
          }
          return ResponseMessage(
              status: action.key,
              body: getAction(action.key, actions)!(bodyParsed),
              message: getMessage(action.key, messages));
        }
      }
      // if no match for status code has been found returns a Default status code
      return ResponseMessage(
          status: ResponseMessageStatusBinder.toStatus(response.statusCode),
          body: null,
          message: getMessage(
              ResponseMessageStatusBinder.toStatus(response.statusCode),
              messages));
    } catch (err) {
      // if the exception is an [InvalidStatusNumberException] it means that the backend returned and unsupported status code
      if (err is InvalidStatusNumberException || err is FormatException) {
        return ResponseMessage(
            status: ResponseMessageStatus.UNDEFINED,
            body: null,
            message: getMessage(ResponseMessageStatus.UNDEFINED, messages));
      }
      // generic error [ResponseMessage]
      return ResponseMessage(
          status: ResponseMessageStatus.s500,
          body: null,
          message: err.toString());
    }
  }

  //HELPER METHODS

  /// Return a Function from the [actions] if it was defined otherwise null
  T Function(Map<String, dynamic>)? getAction(ResponseMessageStatus key,
      Map<ResponseMessageStatus, T Function(Map<String, dynamic>)> actions) {
    if (actions.isNotEmpty) {
      if (actions.containsKey(key) && actions[key] != null) {
        return actions[key];
      }
    }
    return null;
  }

  /// Return a message String custom from [messages] if it was defined otherwise return the default message string from [ResponseMessageStatusBinder.defaultResponseMessages]
  String getMessage(
      ResponseMessageStatus key, Map<ResponseMessageStatus, String>? messages) {
    if (messages != null && messages.isNotEmpty) {
      if (messages.containsKey(key) && messages[key] != null) {
        return messages[key]!;
      }
    }
    return ResponseMessageStatusBinder.defaultResponseMessages[key]!;
  }

  /// Returns a custom header if it was defined otherwise returns the default one [defaultHeader]
  Map<String, String> _hasCustomHeaders(Map<String, String>? header) {
      if (header != null) {
        return header;
      }
      return SendRequests.defaultHeader;
  }

  Map<String, String> _generateHeader(Map<String, String>? header,String? authToken){
    Map<String, String> newHeader = _hasCustomHeaders(header);
    if(authToken != null){
      newHeader.addAll(<String,String>{'Authorization':'Bearer '+authToken});
    }
    return newHeader;
  }

  /// Return the url generated from [backendURL] + [endpoint] + [parameter]
  String _generateUrl(String endponint, String? parameter) {
    var url = backendURL + '/' + endponint;
    if (parameter != null && parameter.isNotEmpty) {
      url += '/' + parameter;
    }
    return url;
  }
}
