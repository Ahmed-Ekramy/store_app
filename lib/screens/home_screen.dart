
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/ProductModel.dart';

import '../services/getAllProductServices.dart';
import '../widgets/customCard.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "New Trend",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,top:75),
        child: FutureBuilder<List<ProductModel>>(
            future: AllProductServices().allProduct(),
            builder: (context, snapshot){
              if (snapshot.hasData) {
                List<ProductModel> product = snapshot.data!;
                return GridView.builder(
                    clipBehavior: Clip.none,
                    itemCount: product.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.3,
                        mainAxisSpacing: 100,
                        crossAxisSpacing: 10,),
                    itemBuilder: (context, index) {
                      return CustomCard(product[index]);
                    });
              }else{
                return const Center(child: CircularProgressIndicator());
              }
            }

            ),
      ),
    );
  }
}
