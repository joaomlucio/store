// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreStore on _StoreStoreBase, Store {
  final _$productsAtom = Atom(name: '_StoreStoreBase.products');

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

  final _$categoriesAtom = Atom(name: '_StoreStoreBase.categories');

  @override
  ObservableList<String> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<String> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$stateAtom = Atom(name: '_StoreStoreBase.state');

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

  final _$startAsyncAction = AsyncAction('_StoreStoreBase.start');

  @override
  Future<dynamic> start() {
    return _$startAsyncAction.run(() => super.start());
  }

  @override
  String toString() {
    return '''
products: ${products},
categories: ${categories},
state: ${state}
    ''';
  }
}
