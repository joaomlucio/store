import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:store/app/modules/products/models/product_model.dart';
import 'package:store/app/modules/start/submodules/store/store_store.dart';
import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  final String title;
  const StorePage({Key? key, this.title = 'Store Page'}) : super(key: key);
  @override
  StorePageState createState() => StorePageState();
}

class StorePageState extends State<StorePage> {
  final StoreStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Modular.to.pushNamed('/products/');
              },
              icon: const Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: Observer(
        builder:(_){
          return GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: .7
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Modular.to.pushNamed('/purchase/',
                    arguments: ProductModel(
                      id: index,
                      name: "Product $index",
                      price: 3.0 * index
                    )
                  );
                },
              );
            }
          );
        }
      ),
    );
  }
}
