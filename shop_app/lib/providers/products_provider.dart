import 'package:flutter/material.dart';
import 'package:shop_app/models/httpException.dart';

import 'dart:convert';

import '../providers/product_provider.dart';
import 'package:http/http.dart' as http;

class ProductsProvider with ChangeNotifier {
  final String authToken;
  List<ProductProvider> _items = [];
  final String userId;

  ProductsProvider(this.authToken, this.userId, this._items);

  Future<void> fetchAndSetProducts([bool filterByUser = false]) async {
    final filterString =
        filterByUser ? '&orderBy="creatorId"&equalTo="$userId"' : '';
    final url = Uri.parse(
      'https://flutter-shop-app-ff381-default-rtdb.asia-southeast1.firebasedatabase.app/products.json?auth=$authToken$filterString',
    );
    try {
      final response = await http.get(url);
      final responseData = jsonDecode(response.body) as Map<String, dynamic>;
      if (responseData == null) {
        return;
      }
      final favUrl = Uri.parse(
          'https://flutter-shop-app-ff381-default-rtdb.asia-southeast1.firebasedatabase.app/userFavorites/$userId.json?auth=$authToken');

      final favoriteResponse = await http.get(favUrl);
      final favoriteData = json.decode(favoriteResponse.body);

      final List<ProductProvider> loadedProducts = [];

      responseData.forEach((prodId, prodData) {
        loadedProducts.add(ProductProvider(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          price: prodData['price'],
          isFavorite:
              favoriteData == null ? false : favoriteData[prodId] ?? false,
          imageUrl: prodData['imageUrl'],
        ));
        _items = loadedProducts;
        notifyListeners();
      });
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  List<ProductProvider> get items {
    return [..._items];
  }

  List<ProductProvider> get favoriteItems {
    return _items.where((item) => item.isFavorite == true).toList();
  }

  ProductProvider findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> addProduct(ProductProvider product) async {
    try {
      final url = Uri.parse(
          'https://flutter-shop-app-ff381-default-rtdb.asia-southeast1.firebasedatabase.app/products.json?auth=$authToken');
      final response = await http.post(url,
          body: json.encode({
            'title': product.title,
            'description': product.description,
            'imageUrl': product.imageUrl,
            'price': product.price,
            'creatorId': userId
          }));

      final newProduct = ProductProvider(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<void> updateProduct(String id, ProductProvider newProduct) async {
    final prodIndex = _items.indexWhere((element) => element.id == id);
    if (prodIndex >= 0) {
      final url = Uri.parse(
          'https://flutter-shop-app-ff381-default-rtdb.asia-southeast1.firebasedatabase.app/products/$id.json?auth=$authToken');
      try {
        await http.patch(
          url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price,
          }),
        );
        _items[prodIndex] = newProduct;
        notifyListeners();
      } catch (e) {
        print(e);
      }
    } else {
      print('Product index out of range');
    }
  }

  void deleteProduct(String id) async {
    final url = Uri.parse(
        'https://flutter-shop-app-ff381-default-rtdb.asia-southeast1.firebasedatabase.app/products/$id.json?auth=$authToken');

    final existingProductIndex =
        _items.indexWhere((element) => element.id == id);

    var existingProduct = _items[existingProductIndex];

    _items.removeAt(existingProductIndex);
    notifyListeners();

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    existingProduct = null;
  }
}
