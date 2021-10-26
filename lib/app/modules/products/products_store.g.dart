// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductsStore on _ProductsStoreBase, Store {
  final _$productsAtom = Atom(name: '_ProductsStoreBase.products');

  @override
  ObservableList<ProductModel> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<ProductModel> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$stateAtom = Atom(name: '_ProductsStoreBase.state');

  @override
  State get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(State value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$startAsyncAction = AsyncAction('_ProductsStoreBase.start');

  @override
  Future<dynamic> start(dynamic _params) {
    return _$startAsyncAction.run(() => super.start(_params));
  }

  @override
  String toString() {
    return '''
products: ${products},
state: ${state}
    ''';
  }
}
