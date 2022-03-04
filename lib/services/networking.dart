import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  var url, finalUrl;

  Future getData() async {
    finalUrl = Uri.parse(url);
    http.Response response = await http.get(finalUrl);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
