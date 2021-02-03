import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel{
  static const ID = "id";
  static const NAME = "name";
  static const AVG_PRICE = "avgPrice";
  static const RATING = "rating";
  static const IMAGE = "image";
  static const POPULAR = "popular";
  static const RATES = "rates";
  //ABOVE IS STRUCTURE HOW IT WILL LOOK IN FIREBASE
  String _id;
  String _name;
  String _image;
  double _avgprice;
  double _rating;
  bool _popular;
  int _rates;

  //now we create the getters to access above variable outside our class
String get id =>_id;
  String get name =>_name;
  String get image =>_image;
  double get avgPrice => _avgprice;
  double  get rating => _rating;
  bool get popular=>_popular;
  int get rates =>_rates;


  RestaurantModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _image = snapshot.data[IMAGE];
    _avgprice = snapshot.data[AVG_PRICE];
    _rating = snapshot.data[RATING];
    _popular = snapshot.data[POPULAR];
    _rates = snapshot.data[RATES];
  }

}