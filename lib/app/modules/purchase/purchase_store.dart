import 'package:mobx/mobx.dart';
import 'package:store/app/modules/purchase/submodules/cart/cart_store.dart';

part 'purchase_store.g.dart';

class PurchaseStore = _PurchaseStoreBase with _$PurchaseStore;
abstract class _PurchaseStoreBase with Store {
  final CartStore cartStore;

  _PurchaseStoreBase({required this.cartStore});

}