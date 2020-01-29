import 'httpRequest.dart';
import 'package:http/http.dart' as http;

class Api {
  static String _url = "http://awesome-dev.eu:8090/";
  static String _sessionId = "";

  static _makeRequest(String url, HttpRequest request) async {
    switch (request.httpVerb) {
      case HttpVerb.get:
        {
          return await http.get(url, headers: request.headers);
        }
        break;

      case HttpVerb.post:
        {
          return await http.post(url,
              body: request.params, headers: request.headers);
        }
        break;

      default:
        {
          print(" !! HTTP VERB UNKNOWN : " + request.httpVerb.toString());
        }
        break;
    }
  }

  static _errorHandler(e) {
    print(e);
  }

  static call(HttpRequest request) async {
    var url = _url + request.route;

    if (request.httpVerb == HttpVerb.get) {
      url += "?";
      request.params.forEach((key, value) => url += key + "=" + value + "&");
    }
    request.headers['JSESSIONID'] = _sessionId;

    try {
      return await _makeRequest(url, request);
    } catch (e) {
      return _errorHandler(e);
    }
  }

  static setSessionId(String sessionId) {
    _sessionId = sessionId;
  }

  static deleteSessionId() {
    _sessionId = "";
  }
}
