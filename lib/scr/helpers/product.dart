import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/products.dart';
class ProductService{
  String collection = "products";
  Firestore _firestore = Firestore.instance;
  Future <List<ProductModel>> getProducts()async{
    return await _firestore.collection(collection).getDocuments().then((result){
      List<ProductModel> products = [];
      for (DocumentSnapshot product in result.documents){
        products.add(ProductModel.fromSnapshot(product));
      }
      return products;


    });
  }
  void likeorDislikeProduct(){

  }

  Future <List<ProductModel>> getProductsByRestaurant({String id})async{

    return await _firestore.collection(collection).where("restaurantId", isEqualTo: id).getDocuments()
        .then((result){

          List<ProductModel> products = [];
          for(DocumentSnapshot product in result.documents){
            products.add(ProductModel.fromSnapshot(product));




          }
    });
  }
  Future<List<ProductModel>> getProductsOfCategory({String category})async{
    return
    _firestore.collection(collection).where("category", isEqualTo: category)
        .getDocuments().then((result){
          List<ProductModel> products = [];
          for(DocumentSnapshot product in result.documents){
            products.add(ProductModel.fromSnapshot(product));
          }
          return products;
    });
    
  }

  Future <List<ProductModel>> searchProducts({String productName}){
    String searchKey = productName[0].toUpperCase()+ productName.substring(1);
    return _firestore.collection(collection).orderBy("name")
        .startAt([searchKey])
        .endAt([searchKey+ '\uf8ff'])
        .getDocuments().then((result){
          List<ProductModel> products = [];
          for(DocumentSnapshot product in result.documents){
            products.add(ProductModel.fromSnapshot(product));
          }
          return products;
    });
  }

}