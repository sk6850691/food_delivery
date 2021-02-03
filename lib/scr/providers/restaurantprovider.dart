import 'package:flutter/material.dart';
import '../helpers/restaurantservice.dart';
import '../models/restaurants.dart';
class RestaurantProvider with ChangeNotifier{
  RestaurantServices _restaurantServices = RestaurantServices();
  List<RestaurantModel> restaurant =[];
  RestaurantProvider.initialize(){
    _loadRestaurant();
  }
  _loadRestaurant()async{
    restaurant = await _restaurantServices.getrestaurants();
    notifyListeners();

  }
}