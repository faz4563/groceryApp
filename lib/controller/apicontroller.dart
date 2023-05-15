// ignore_for_file: avoid_print, file_names, import_of_legacy_library_into_null_safe

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiController {
  static get(String url) async {
    var response = await http.get(Uri.parse(url));
    print('res >> post ${response.body}');
    return jsonDecode(response.body);
  }

  static Future post(String url, data) async {
    var response = await http.post(
      Uri.parse(url),
      body: data,
      headers: {"Content-Type": "application/json"},
    );
    print('res >> post ${response.body}');
    // if (response.body.isNotEmpty) {
    return jsonDecode(response.body);
    // }
  }

  static put(String url, Map data) async {
    var response = await http.put(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: {"Content-Type": "application/json"},
    );
    print('put response ${response.body}');
    return jsonDecode(response.body);
  }
}
