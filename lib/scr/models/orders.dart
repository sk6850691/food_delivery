import 'package:cloud_firestore/cloud_firestore.dart';

class orderModel{
  static const ID = "id";
  static const NAME = "name";
  static const PRODUCT_ID = "productID";
  static const PRICE = "price";
  static const STATUS = "status";
  //ABOVE IS STRUCTURE HOW IT WILL LOOK IN FIREBASE 
  String _id;
  String _name;
  String _productID;
  double _price;
  String _status;

  //now we create the getters to access above variable outside our class
String get id =>_id;
String get name =>_name;
String get productId =>_productID;
double get price => _price;
String  get Status => _status;

orderModel.fromSnapshot(DocumentSnapshot snapshot){
  _id = snapshot.data[ID];
  _name = snapshot.data[NAME];
  _productID = snapshot.data[PRODUCT_ID];
  _price = snapshot.data[PRICE];
  _status = snapshot.data[STATUS];
}

}