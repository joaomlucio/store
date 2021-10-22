import 'package:flutter_test/flutter_test.dart';
import 'package:store/app/modules/purchase/purchase_store.dart';
 
void main() {
  late PurchaseStore store;

  setUpAll(() {
    store = PurchaseStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}