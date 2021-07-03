import 'package:flutter_easy_start/core/repositories/response_message/response_message_status.dart';

class ResponseMessage<T>{
  ResponseMessageStatus status;
  String message;
  T body;
  ResponseMessage({this.status,this.body,this.message});

  ResponseMessage updateResponseMessage(newBody){
    new ResponseMessage(status: this.status,body: newBody,message: this.message);
  }

  ResponseMessage invalidateBody(){
    new ResponseMessage(status: this.status,body: null,message: this.message);
  }

}
