import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String uri, @required String? token}) async {
    http.Response response = await http.get(Uri.parse(uri));
    print(response.body);
    if (response.statusCode == 200) {
     //List< Map<String, dynamic>> data = jsonDecode(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with statusCode${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url, @required dynamic body, @required String? token}) async {
    Map<String, String>headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(Uri.parse(url),
        body: body,
        headers: headers
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'there is a problem with statusCode${response.statusCode}');
    }
  }

  Future<dynamic> put(
      {required String uri, @required dynamic body, @required String? token}) async {
    Map<String, String>headers = {};
    print('${uri }${body} ${token}');
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.put(
        Uri.parse(uri), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception(
          'there is a problem with statusCode${response.statusCode}');
    }
  }
}
