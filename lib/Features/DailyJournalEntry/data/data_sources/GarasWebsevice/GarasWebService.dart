import 'package:http/http.dart' as http;

class GarasWebServices {}

const UserToken = '7Xy5UcKmQuH7K6br7YwhZQ%3d%3d';

class HttpHelper {
  postApi({
    required Uri url,
    required Map<String, String> headers,
    required String body,
  }) async {
    http.Response response = await http.post(url, headers: headers, body: body);

    print("*************************");
    print("Method Post");
    print("url $url");
    print("headers $headers");
    print("body $body");
    print("response status code ${response.statusCode}");
    print("response body code ${response.body}");
    print("-------------------------");

    return response;
  }

  static getApi(
      {required Uri url, required Map<String, String> headers}) async {
    http.Response response = await http.get(url, headers: headers);

    print("*************************");
    print("Method Get");
    print("url $url");
    print("headers $headers");
    print("response status code ${response.statusCode}");
    print("response body code ${response.body}");
    print("-------------------------");

    return response;
  }
}
