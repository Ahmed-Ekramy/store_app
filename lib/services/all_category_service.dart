import 'dart:convert';

import 'package:http/http.dart'as http;

import '../helper/api.dart';
class AllCategoryServices{
  Future<List<dynamic>> allCategory()async{
    List<dynamic>data=await Api().get(uri: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
