import 'package:mobx/mobx.dart';
import 'package:store/app/modules/products/models/product_model.dart';
import 'package:store/app/modules/products/repositories/product_repository.dart';
import 'package:store/app/shared/enums/state_enum.dart';

part 'products_store.g.dart';

class ProductsStore = _ProductsStoreBase with _$ProductsStore;

abstract class _ProductsStoreBase with Store {
  @observable
  ObservableList<ProductModel> products = <ProductModel>[].asObservable();

  @observable
  State state = State.loading;

  late ProductRepository repo;

  // ignore: unused_element
  _ProductsStoreBase([ProductRepository? repository, String? params]) {
    repo = repository ?? ProductRepository();
  }

  @action
  Future start(_params) async {
    try {
      products = (await repo.fetchProducts(_params)).asObservable();
      state = State.started;
    } catch (e) {
      rethrow;
    }
  }
}
