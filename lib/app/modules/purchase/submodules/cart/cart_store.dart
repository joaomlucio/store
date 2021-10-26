
import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:store/app/modules/products/models/product_model.dart';
import 'package:store/app/modules/purchase/submodules/cart/models/cart_model_store.dart';

part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  ObservableList<CartModelStore> cartProducts =
      ObservableList<CartModelStore>();

  //Round to
  double dp(double val, int places){ 
   num mod = pow(10.0, places); 
   return ((val * mod).round().toDouble() / mod); 
  }

  @observable
  double _price = 0;

  @computed
  double get price => dp(_price, 2);

  

  @action
  void addProduct(ProductModel _product) {
    int index =
        cartProducts.indexWhere((value) => _product.id == value.product.id);
    if (index != -1) {
      cartProducts[index].add();
    } else {
      cartProducts.add(CartModelStore(product: _product));
    }
    _price += _product.price;
  }

  @action
  void removeProduct(ProductModel _product) {
    int index =
        cartProducts.indexWhere((value) => _product.id == value.product.id);
    if (cartProducts[index].items_number == 1) {
      cartProducts.removeAt(index);
    } else {
      cartProducts[index].remove();
    }
    _price -= _product.price;
  }

}
