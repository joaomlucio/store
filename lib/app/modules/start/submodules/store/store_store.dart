import 'package:mobx/mobx.dart';

part 'store_store.g.dart';

class StoreStore = _StoreStoreBase with _$StoreStore;
abstract class _StoreStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}