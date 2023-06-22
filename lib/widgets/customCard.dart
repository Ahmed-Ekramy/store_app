import 'package:flutter/material.dart';
import 'package:store_app/models/ProductModel.dart';

import '../screens/updateProduct.dart';

class CustomCard extends StatelessWidget {
final ProductModel product;
  const CustomCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, Update_Product.routeName,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            // height: 120,
            // width: 220,
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0,6),
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Text(
                        r"$" "${product.price.toString()}",
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: 25,
              top: -65,
              child: Image.network(
               product.image,
                height: 100,width: 100,
              ))
        ],
      ),
    );
  }
}
