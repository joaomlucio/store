import 'package:dio/dio.dart';
import 'package:store/app/modules/products/models/product_model.dart';

class ProductRepository {
  late Dio dio;
  final url = 'https://fakestoreapi.com/products';

  ProductRepository([Dio? client]) {
    dio = client ?? Dio();
  }

  Future<List<ProductModel>> fetchProducts(String? params) async {
    final response =
        params != null ? await dio.get(url + params) : await dio.get(url);
    final List<ProductModel> products = [];
    if (response.statusCode == 200) {
      response.data
          .forEach((value) => products.add(ProductModel.fromMap(value)));
    }
    return products;
  }

  Future<List<String>> fetchCategories(String? params) async {
    final response =
        params != null ? await dio.get(url + params) : await dio.get(url);
    List<String> categories = [];
    if (response.statusCode == 200) {
      response.data.forEach((value)=>categories.add(value));
    }
    return categories;
  }
}
