import 'package:mobx/mobx.dart';

part 'start_store.g.dart';

class StartStore = _StartStoreBase with _$StartStore;
abstract class _StartStoreBase with Store{

  @observable
  late int page = 1;

}