// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStoreBase, Store {
  Computed<double>? _$priceComputed;

  @override
  double get price => (_$priceComputed ??=
          Computed<double>(() => super.price, name: '_CartStoreBase.price'))
      .value;

  final _$_priceAtom = Atom(name: '_CartStoreBase._price');

  @override
  double get _price {
    _$_priceAtom.reportRead();
    return super._price;
  }

  @override
  set _price(double value) {
    _$_priceAtom.reportWrite(value, super._price, () {
      super._price = value;
    });
  }

  final _$_CartStoreBaseActionController =
      ActionController(name: '_CartStoreBase');

  @override
  void addProduct(ProductModel _product) {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.addProduct');
    try {
      return super.addProduct(_product);
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeProduct(ProductModel _product) {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.removeProduct');
    try {
      return super.removeProduct(_product);
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
price: ${price}
    ''';
  }
}
