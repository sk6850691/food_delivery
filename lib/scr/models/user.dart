import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class UserModel{
  static const NAME = "name";
  static const EMAIL = "email";
  static const ID = "id";
  //only field names that will be added to database


  String _name;
  String _email;
  String _id;


  //these are variables that will actually hold the data

String get name => _name;
String get email => _email;
String get id => _id;

  UserModel.fromSnapshot(DocumentSnapshot documentSnapshot){
    //.fromSnapshot is a constructor
    _name = documentSnapshot.data[NAME];
    _email = documentSnapshot.data[EMAIL];
    _id = documentSnapshot.data[ID];

  }

}