import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:store/app/modules/products/products_store.dart';
import 'package:store/app/shared/enums/state_enum.dart' as stt;

class ProductsPage extends StatefulWidget {
  final String categoryName;

  const ProductsPage({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  @override
  ProductsPageState createState() => ProductsPageState();
}

class ProductsPageState extends State<ProductsPage> {
  final ProductsStore store = Modular.get<ProductsStore>();

  @override
  void initState() {
    super.initState();
    store.start(widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              widget.categoryName.replaceAll('/category/', '').toUpperCase()),
        ),
        body: SingleChildScrollView(
          child: Observer(builder: (BuildContext context) {
            if (store.state == stt.State.started) {
              return GridView.builder(
                  shrinkWrap: true,
                  itemCount: store.products.length,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: .7),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        child: Column(children: [
                          ClipRRect(
                              child: Image.network(store.products[index].image,
                                  width: 100, height: 100, fit: BoxFit.fill)),
                          Expanded(
                            child: Column(
                              children: [
                                Text(store.products[index].title),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      const Text("Price: "),
                                      Text("${store.products[index].price}"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                      onTap: () {
                        Modular.to.pushNamed('/purchase/',
                            arguments: store.products[index]);
                      },
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
        ));
  }
}
