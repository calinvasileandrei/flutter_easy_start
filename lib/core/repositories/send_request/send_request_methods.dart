import 'package:http/http.dart' as http;

enum SendRequestsMethods{
  GET,POST,PUT,DELETE,PATCH
}

class SendRequestMethodSelector{

  /// Return a http method associated with the [SendRequestsMethods]
  static Function chose(SendRequestsMethods? method){
    switch(method){
      case SendRequestsMethods.GET:
        return _sendGet;
      case SendRequestsMethods.POST:
        return _sendPost;
      case SendRequestsMethods.PUT:
        return _sendPut;
      case SendRequestsMethods.PATCH:
        return _sendPatch;
      case SendRequestsMethods.DELETE:
        return _sendDelete;
      default:
        return _sendGet;
    }
  }

  /// GENERICS HTTP METHODS

  static Future<http.Response> _sendGet(
      String url, Map<String, String> header, String body) async {
    return await http.get(Uri.parse(url), headers: header);
  }

  static Future<http.Response> _sendPost(
      String url, Map<String, String> header, String body) async {
    return await http.post(Uri.parse(url), headers: header, body: body);
  }

  static Future<http.Response> _sendPut(
      String url, Map<String, String> header, String body) async {
    return await http.put(Uri.parse(url), headers: header, body: body);
  }

  static Future<http.Response> _sendPatch(
      String url, Map<String, String> header, String body) async {
    return await http.put(Uri.parse(url), headers: header, body: body);
  }

  static Future<http.Response> _sendDelete(
      String url, Map<String, String> header, String body) async {
    return await http.delete(Uri.parse(url), headers: header);
  }



}
