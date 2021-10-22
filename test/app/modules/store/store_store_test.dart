import 'package:flutter_test/flutter_test.dart';
import 'package:store/app/modules//start/submodules/store//store_store.dart';
 
void main() {
  late StoreStore store;

  setUpAll(() {
    store = StoreStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}