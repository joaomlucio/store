import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store/app/modules/start/start_module.dart';
 
void main() {

  setUpAll(() {
    initModule(StartModule());
  });
}