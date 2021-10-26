import 'package:mobx/mobx.dart';
import 'package:store/app/modules/products/models/product_model.dart';

part 'cart_model_store.g.dart';

class CartModelStore = _CartModelStoreBase with _$CartModelStore;

abstract class _CartModelStoreBase with Store {
  final ProductModel product;

  @observable
  // ignore: non_constant_identifier_names
  int _items_number = 1;

  @computed
  // ignore: non_constant_identifier_names
  int get items_number => _items_number;

  _CartModelStoreBase({required this.product});

  @action
  double getTotalPrice() {
    return _items_number * product.price;
  }

  @action
  void add() {
    _items_number++;
  }

  @action
  void remove() {
    _items_number--;
  }
}
