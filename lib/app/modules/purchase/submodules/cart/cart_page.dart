import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:store/app/modules/purchase/submodules/cart/cart_store.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final String title;
  const CartPage({Key? key, this.title = 'Cart Page'}) : super(key: key);
  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  final CartStore store = Modular.get<CartStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        if (store.cartProducts.isNotEmpty) {
          return ListView(children: [
            ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: store.cartProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.blueAccent,
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: Image.network(
                          store.cartProducts[index].product.image,
                          width: 50,
                          fit: BoxFit.cover),
                      title: Text(
                        store.cartProducts[index].product.title,
                      ),
                      subtitle: Text(
                          "Price: R\$${store.cartProducts[index].product.price}"),
                      trailing: SizedBox(
                        width: 120,
                        child: Expanded(
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                onPressed: () => {
                                  store.addProduct(
                                      store.cartProducts[index].product)
                                },
                                icon: const Icon(Icons.arrow_upward_outlined),
                              ),
                              Observer(builder: (_) {
                                return Text(
                                    "${store.cartProducts[index].items_number}");
                              }),
                              IconButton(
                                onPressed: () => {
                                  store.removeProduct(
                                      store.cartProducts[index].product)
                                },
                                icon: const Icon(Icons.arrow_downward_outlined),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total: ",
                      style: TextStyle(),
                      textScaleFactor: 1.5,
                    ),
                    Text(
                      "R\$${store.price}",
                      textScaleFactor: 1.5,
                    ),
                  ],
                ),
              ]),
            ),
          ]);
        } else {
          return const Center(
            heightFactor: 20,
            child: Text(
              "No Items in the Cart",
              textScaleFactor: 2,
            ),
          );
        }
      }),
    );
  }
}
