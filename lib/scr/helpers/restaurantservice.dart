import '../models/restaurants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantServices{
  String collection = "restaurants";
  Firestore _firestore = Firestore.instance;

  Future<List<RestaurantModel>> getrestaurants()async{
    return await _firestore.collection(collection).getDocuments().then((result){
      List<RestaurantModel> restaurants = [];
      for (DocumentSnapshot restaurant in result.documents){
       restaurants.add(RestaurantModel.fromSnapshot(restaurant));
        //now this category will work as a object of type CategoryModel
      }
      return restaurants;

    });
  }


}