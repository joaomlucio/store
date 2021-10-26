import 'package:mobx/mobx.dart';

import 'package:store/app/modules/products/models/product_model.dart';
import 'package:store/app/modules/products/products_store.dart';
import 'package:store/app/shared/enums/state_enum.dart';

part 'store_store.g.dart';

class StoreStore = _StoreStoreBase with _$StoreStore;

abstract class _StoreStoreBase with Store {
  final ProductsStore productStore;

  @observable
  ObservableList<ProductModel> products = <ProductModel>[].asObservable();

  @observable
  ObservableList<String> categories = <String>[].asObservable();

  @observable
  State state = State.loading;

  _StoreStoreBase(
    this.productStore,
  ) {
    start();
  }

  @action
  Future start() async {
    try {
      products =
          (await productStore.repo.fetchProducts("?limit=16")).asObservable();
      categories = (await productStore.repo.fetchCategories('/categories'))
          .asObservable();
      state = State.started;
    } catch (e) {
      rethrow;
    }
  }
}
