import 'package:flutter_modular/flutter_modular.dart';
import 'package:store/app/modules/purchase/purchase_store.dart';
import 'package:flutter/material.dart';
import 'package:store/app/modules/products/models/product_model.dart';

class PurchasePage extends StatefulWidget {
  final ProductModel product;
  final String title;
  const PurchasePage(
      {Key? key, this.title = 'Purchase Page', required this.product})
      : super(key: key);
  @override
  PurchasePageState createState() => PurchasePageState();
}

class PurchasePageState extends State<PurchasePage> {
  final PurchaseStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Modular.to.pushNamed('/purchase/cart/');
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Text("Produto: "),
                        Text("${widget.product.id} - ${widget.product.name}")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Text("Price: "),
                        Text("${widget.product.price}")
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
