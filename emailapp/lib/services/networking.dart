import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw 'Error on request ${response.statusCode}';
      }
    } catch (e) {
      print('__Network_request_url__ $url');
      print('__Network_request_status__${e.toString()}');
      return null;
    }
  }
}
