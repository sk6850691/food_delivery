import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/scr/models/user.dart';
class UserService{

  String Collection = "users";
  Firestore _firestore = Firestore.instance;
  void createUser(Map<String,dynamic>values){
    String id = values["id"];

    _firestore.collection(Collection).document(id).setData(values);


  }
  void updateUserData(Map<String,dynamic>values){
    _firestore.collection(Collection).document(values['id']).updateData(values);
  }
  Future <UserModel> getUserById(String id) => _firestore.collection(Collection).document(id).get().then((doc){
    return  UserModel.fromSnapshot(doc);
  });
}