import 'package:store_app/helper/api.dart';

import '../models/ProductModel.dart';

class Update_Service {
  Future<ProductModel> update_product({
  required String title,
  required String price,
  required String description,
  required String image,
    required int id,
  required String category,
  }) async {
    print("prodcut id $id");
  Map<String, dynamic> data =
  await Api().put(uri: 'https://fakestoreapi.com/products/$id', body: {
    'id':id,
  'title': title,
  'price': price,
  'description': description,
  'image': image,
  'category': category
  },
  );
  return ProductModel.fromJson(data);
  }
  }
