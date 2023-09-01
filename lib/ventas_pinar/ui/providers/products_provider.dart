import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ventas_pinar/ventas_pinar/infra/models/product_model.dart';

class ProductsProvider {
  final Uri _url = Uri(
      scheme: 'https',
      host: 'ventaspinar-bc906-default-rtdb.firebaseio.com',
      path: 'productos.json');

  Future<bool> postProduct(ProductModel product) async {
    final response = await http.post(_url, body: productModelToJson(product));
    return true;
  }

  Future<List<ProductModel>> getProduct() async {
    final List<ProductModel> listProducts = List.empty(growable: true);
    final response = await http.get(_url);

    final Map<String, dynamic> decodedData = jsonDecode(response.body);

    decodedData.forEach((id, producto) {
      final prodTemp = ProductModel.fromJson(producto);
      prodTemp.id = id;
      listProducts.add(prodTemp);
    });
    return listProducts;
  }

  void deleteProduct(String id) async {
    final url = _url.replace(path: 'productos/$id.json');
    final response = await http.delete(url);
  }

  void editProduct(ProductModel product) async {
    final url = _url.replace(path: 'productos/${product.id}.json');
    // print(url);
    final response = await http.put(url, body: productModelToJson(product));
  }
}
