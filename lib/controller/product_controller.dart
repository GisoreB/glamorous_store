import 'package:glamorous_store/model/product.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';

class ProductController {
  var dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));


  static Future<List<Product>> fetchProduct() async {
    Response response = await Dio().get('https://fakestoreapi.com/products');
    return (response.data as List).map((x) => Product.fromJson(x)).toList();
  }

  static Future<List<Product>> fetchProductByCategories(
      String categoriesName) async {
    Response response = await Dio()
        .get('https://fakestoreapi.com/products/category/$categoriesName');
    return (response.data as List).map((x) => Product.fromJson(x)).toList();
  }

  static Future<Product> fetchProductByID(int productId) async {
    Response response =
    await Dio().get('https://fakestoreapi.com/products/$productId');
    Product product = Product.fromJson(response.data);
    return product;
  }

}
