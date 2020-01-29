enum HttpVerb { get, post, put, patch, delete }

class HttpRequest {
  HttpVerb httpVerb;
  String route;
  var params;
  Map headers;

  HttpRequest(HttpVerb httpVerb, String route, var params,
      [Map<String, String> headers]) {
    this.httpVerb = httpVerb;
    this.route = route;
    this.params = params;
    this.headers = headers != null ? headers : new Map<String, String>();
  }
}
