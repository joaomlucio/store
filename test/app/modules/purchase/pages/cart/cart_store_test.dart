import 'package:flutter_test/flutter_test.dart';
import 'package:store/app/modules/purchase/submodules/cart/cart_store.dart';
 
void main() {
  late CartStore store;

  setUpAll(() {
    store = CartStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}