import 'package:http/http.dart';

import 'Exceptions/InvalidCredentialsException.dart';
import 'api.dart';
import 'httpRequest.dart';

class UserService extends Api {
  static _extractSessionId(Response response) {
    var str = response.headers["set-cookie"];
    const start = "JSESSIONID=";
    const end = ";";

    final startIndex = str.indexOf(start);
    final endIndex = str.indexOf(end, startIndex + start.length);

    return str.substring(startIndex + start.length, endIndex);
  }

  static login(String login, String password) async {
    var response = await Api.call(new HttpRequest(
        HttpVerb.post, "login", {"username": login, "password": password}));
    if (response.statusCode == 200) {
      Api.setSessionId(_extractSessionId(response));
      return true;
    } else
      throw new InvalidCredentialsException();
  }

  static customerName(String name) async {
    var response = await Api.call(
        new HttpRequest(HttpVerb.post, "client", {"last_name": name}));
    return response;
  }
}
