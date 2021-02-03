import 'package:flutter/material.dart';
import '../helpers/product.dart';
import '../models/products.dart';

class ProductProvider with ChangeNotifier{
  ProductService _productService = ProductService();
  List <ProductModel> products = [];
  List <ProductModel> productByCategory = [];
  List <ProductModel> productByRestaurant = [];
  List <ProductModel> productsSearched = [];

  ProductProvider.initialize(){
    loadProducts();
  }

  loadProducts()async{
    products = await _productService.getProducts();
    notifyListeners();

  }
  Future loadProductByCategory({String CategoryName})async{
    productByCategory = await _productService.getProductsOfCategory(category:CategoryName);
    notifyListeners();
  }
  Future loadProductByRestaurant({String restaurantId})async{
       productByRestaurant = await _productService.getProductsByRestaurant(id: restaurantId);
       notifyListeners();

  }
  Future search({String productName})async{
    productsSearched = await _productService.searchProducts(productName: productName );
    notifyListeners();
  }}