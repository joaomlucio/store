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
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(15),
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom:8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            widget.product.image,
                            width: 150,
                            height: 150,
                            fit: BoxFit.fill,
                          )
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(child: Text(widget.product.title))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20),
                        child: Row(
                          children: <Widget>[
                            const Text("Price: "),
                            Text("R\$${widget.product.price}")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.product.description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                                softWrap: false,
                                textAlign: TextAlign.justify,
                              )
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  store.cartStore.addProduct(widget.product);
                  Modular.to.pushNamed('/purchase/cart/');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const  [
                    Text("Add to cart"),
                    Icon(Icons.shopping_cart_outlined),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
