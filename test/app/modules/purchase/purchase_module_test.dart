import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store/app/modules/purchase/purchase_module.dart';

void main() {
  setUpAll(() {
    initModule(PurchaseModule());
  });
}
