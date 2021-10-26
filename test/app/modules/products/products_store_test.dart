import 'package:flutter_test/flutter_test.dart';
import 'package:store/app/modules/products/products_store.dart';

void main() {
  late ProductsStore store;

  setUpAll(() {
    store = ProductsStore();
  });

  test('increment count', () async {
    //expect((await store.repo.fetchProducts('?limit=16'))[0].title, equals(ProductModel.fromMap({"id":1,"title":"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops","price":109.95,"description":"Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday","category":"men's clothing","image":"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg","rating":{"rate":3.9,"count":120}}).title));
    // ignore: avoid_print
    print(await store.repo.fetchCategories('/categories'));
    //expect(store.value, equals(1));
  });
}
