
import 'package:store_app/helper/api.dart';
import '../models/ProductModel.dart';

class AllProductServices {
  Future<List<ProductModel>> allProduct() async {
    print("xxxx");
  final data= await Api().get(uri:'https://fakestoreapi.com/products', token: '');
    print("data");
    List<ProductModel> allproduct = [];
    for (int i = 0; i < data.length; i++) {
      allproduct.add(ProductModel.fromJson(data[i]));
    }
    return allproduct;
  }
}