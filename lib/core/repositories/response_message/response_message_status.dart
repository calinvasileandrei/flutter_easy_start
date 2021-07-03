import 'package:flutter_easy_start/core/repositories/response_message/response_message_exception.dart';

enum ResponseMessageStatus{
  s200, // OK
  s204, // No Content
  s400, // Bad Request
  s401, // Unauthorized
  s403, // Forbidden
  s404, // Not Found
  s405, // Method Not Allowed
  s408, // Request Timeout
  s415, // Unsupported Media Type
  s500, // Internal Server Error
  s501, // Not Implemented
  s503, // Bad Gateway
  s505, // Service Unavailable
  s507, // Insufficient Storage
}

class ResponseMessageStatusBinder{

  static int fromStatus(ResponseMessageStatus status){
    String stringStatus = status.toString();
    return int.parse(stringStatus);
  }

  static ResponseMessageStatus toStatus(int status){
    String stringStatus = "ResponseMessageStatus.s"+status.toString();
    try{
      ResponseMessageStatus statusBinded = ResponseMessageStatus.values.firstWhere((e) => e.toString() == stringStatus);
      return statusBinded;
    }catch(e){
      throw new InvalidStatusNumberException("The status number provided to be converted is not supported by ResponseMessageStatus");
    }
  }
}
