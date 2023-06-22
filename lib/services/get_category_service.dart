import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/ProductModel.dart';

class GetCategory {
  Future<List<ProductModel>> getcategorey({required String categoryName}) async
  {
    List<dynamic> data = await Api().get(uri:"https://fakestoreapi.com/products/category/$categoryName" );
    print(data);
   List<ProductModel>ProductList=[];
   for(int i=0;i<data.length;i++){
     ProductList.add (ProductModel.fromJson(data[i]));
   }
   return ProductList;
  }
}