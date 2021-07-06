import 'response_message_status.dart';

class ResponseMessage<T> {
  ResponseMessageStatus? status;
  String? message;
  T? body;
  ResponseMessage({this.status, this.body, this.message});

  ResponseMessage updateResponseMessage(newBody) {
    return ResponseMessage(status: status, body: newBody, message: message);
  }

  ResponseMessage invalidateBody() {
    return ResponseMessage(status: status, body: null, message: message);
  }

  @override
  String toString() {
    return 'ResponseMessage{\n status: $status,\n message: $message,\n body: $body\n}';
  }
}
