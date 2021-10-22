import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:store/app/modules/products/products_store.dart';
import 'package:store/app/modules/products/models/product_model.dart';

class ProductsPage extends StatefulWidget {
  final String storeName;

  const ProductsPage({
    Key? key,
    required this.storeName,
  }) : super(key: key);

  @override
  ProductsPageState createState() => ProductsPageState();
}

class ProductsPageState extends State<ProductsPage> {
  final ProductsStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.storeName),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Modular.to.pushNamed('/purchase/',
                  arguments: ProductModel(
                      id: index, name: "Product $index", price: 3.0 * index));
            },
            title: Text("Product $index"),
            subtitle: const Text("Goods"),
            leading: CircleAvatar(
              child: Text("P$index"),
            ),
          );
        },
      ),
    );
  }
}
