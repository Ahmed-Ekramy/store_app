import 'dart:convert';

import '../models/ProductModel.dart';
import 'package:http/http.dart'as http;

class AllProductServices{
  Future<List<ProductModel>>allProduct()async{
    http.Response respons= await http.get(Uri.parse('https://fakestoreapi.com/products'));
     List<dynamic>data=jsonDecode(respons.body);
          List<ProductModel> allproduct=[];
     for(int i=0;i<data.length;i++){
       allproduct.add(ProductModel.fromJson(data[i]));
     }
return allproduct;
  }
}