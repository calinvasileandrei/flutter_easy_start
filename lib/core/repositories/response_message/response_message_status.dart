import 'response_message_exception.dart';

enum ResponseMessageStatus {
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
  UNDEFINED,
}

class ResponseMessageStatusBinder {
  static Map<ResponseMessageStatus, String> defaultResponseMessages = {
    ResponseMessageStatus.s200: 'OK',
    ResponseMessageStatus.s204: 'No Content',
    ResponseMessageStatus.s400: 'Bad Request',
    ResponseMessageStatus.s401: 'Unauthorized',
    ResponseMessageStatus.s403: 'Forbidden',
    ResponseMessageStatus.s404: 'Not Found',
    ResponseMessageStatus.s405: 'Method Not Allowed',
    ResponseMessageStatus.s408: 'Request Timeout',
    ResponseMessageStatus.s415: 'Unsupported Media Type',
    ResponseMessageStatus.s500: 'Internal Server Error',
    ResponseMessageStatus.s501: 'Not Implemented',
    ResponseMessageStatus.s503: 'Bad Gateway',
    ResponseMessageStatus.s505: 'Service Unavailable',
    ResponseMessageStatus.s507: 'Insufficient Storage',
    ResponseMessageStatus.UNDEFINED: 'Status Undefined'
  };


  static int fromStatus(ResponseMessageStatus status) {
    var stringStatus = status.toString();
    var numericStatus = stringStatus.substring(stringStatus.length-3);
    return int.parse(numericStatus);
  }

  static ResponseMessageStatus toStatus(int status) {
    var stringStatus = 'ResponseMessageStatus.s' + status.toString();
    try {
      var statusBinded = ResponseMessageStatus.values
          .firstWhere((e) => e.toString() == stringStatus);
      return statusBinded;
    } catch (e) {
      throw InvalidStatusNumberException(
          'The status number provided to be converted is not supported by ResponseMessageStatus');
    }
  }
}
