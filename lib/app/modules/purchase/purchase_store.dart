import 'package:mobx/mobx.dart';

part 'purchase_store.g.dart';

class PurchaseStore = _PurchaseStoreBase with _$PurchaseStore;
abstract class _PurchaseStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}