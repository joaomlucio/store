// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartModelStore on _CartModelStoreBase, Store {
  Computed<int>? _$items_numberComputed;

  @override
  int get items_number =>
      (_$items_numberComputed ??= Computed<int>(() => super.items_number,
              name: '_CartModelStoreBase.items_number'))
          .value;

  final _$_items_numberAtom = Atom(name: '_CartModelStoreBase._items_number');

  @override
  int get _items_number {
    _$_items_numberAtom.reportRead();
    return super._items_number;
  }

  @override
  set _items_number(int value) {
    _$_items_numberAtom.reportWrite(value, super._items_number, () {
      super._items_number = value;
    });
  }

  final _$_CartModelStoreBaseActionController =
      ActionController(name: '_CartModelStoreBase');

  @override
  double getTotalPrice() {
    final _$actionInfo = _$_CartModelStoreBaseActionController.startAction(
        name: '_CartModelStoreBase.getTotalPrice');
    try {
      return super.getTotalPrice();
    } finally {
      _$_CartModelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add() {
    final _$actionInfo = _$_CartModelStoreBaseActionController.startAction(
        name: '_CartModelStoreBase.add');
    try {
      return super.add();
    } finally {
      _$_CartModelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove() {
    final _$actionInfo = _$_CartModelStoreBaseActionController.startAction(
        name: '_CartModelStoreBase.remove');
    try {
      return super.remove();
    } finally {
      _$_CartModelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items_number: ${items_number}
    ''';
  }
}
