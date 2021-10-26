import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:store/app/modules/start/submodules/store/store_store.dart';
import 'package:flutter/material.dart';
import 'package:store/app/shared/enums/state_enum.dart' as sst;

class StorePage extends StatefulWidget {
  final String title;
  const StorePage({Key? key, this.title = 'Store Page'}) : super(key: key);
  @override
  StorePageState createState() => StorePageState();
}

class StorePageState extends State<StorePage> {
  final StoreStore store = Modular.get<StoreStore>();

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
                icon: const Icon(Icons.shopping_cart_outlined)),
          ],
        ),
        body: Observer(builder: (context) {
          if (store.state == sst.State.started) {
            return ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  height: 60.0,
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.store_mall_directory_outlined,
                          color: Colors.white, size: 30.0),
                      Padding(padding: EdgeInsets.only(right: 5.0)),
                      Text('STORE PROJECT',
                          style:
                              TextStyle(color: Colors.white, fontSize: 23.0)),
                    ],
                  ),
                ),
                Observer(builder: (_) {
                  return GridView.builder(
                      shrinkWrap: true,
                      itemCount: store.products.length,
                      physics: const ScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: .7),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Card(
                            margin: const EdgeInsets.all(10),
                            child: Column(children: [
                              ClipRRect(
                                  child: Image.network(
                                      store.products[index].image,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.fill)),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(store.products[index].title),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: [
                                          const Text("Price: "),
                                          Text(
                                              "${store.products[index].price}"),
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
                }),
                Observer(builder: (_) {
                  return Column(
                    children: [
                      Container(
                        height: 60.0,
                        color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(Icons.store_mall_directory_outlined,
                                color: Colors.white, size: 30.0),
                            Text('CATEGORIES',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 23.0)),
                          ],
                        ),
                      ),
                      GridView.builder(
                          shrinkWrap: true,
                          itemCount: store.categories.length,
                          physics: const ScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 3),
                          itemBuilder: (_, index) {
                            return InkWell(
                              child: Card(
                                  margin: const EdgeInsets.all(8),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(4, .4))),
                                  child: Center(
                                      child: Text(store.categories[index]
                                          .toUpperCase()))),
                              onTap: () {
                                Modular.to.pushNamed('/products',
                                    arguments:
                                        '/category/${store.categories[index]}');
                              },
                            );
                          }),
                    ],
                  );
                })
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
