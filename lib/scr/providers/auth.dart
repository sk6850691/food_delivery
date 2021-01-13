import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/scr/models/user.dart';

import 'package:food_delivery/scr/models/userservice.dart';
enum Status{ Uninitialized,Unauthenticated, Authenticating,Authenticated}
class AuthProvider with ChangeNotifier{
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  Firestore _firestore = Firestore.instance;
  UserService _userService = UserService();
  UserModel _userModel;
  //getters
  Status get status =>_status;
  FirebaseUser get user => _user;
  UserModel get userModel =>_userModel;

  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthProvider.initialize(): _auth = FirebaseAuth.instance{
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }
  //initialize is a named constructor

  Future<bool> signIn()async{
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email.text,password: password.text);
      return true;
    }catch(e){
      print(e);
    }
  }

  Future<bool> signOut()async{
    notifyListeners();
    await _auth.signOut();
  }

  Future<bool> signUp()async{
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(email: email.text.trim(),password: password.text.trim()).then((result){
        _firestore.collection('users').document(result.user.uid).setData({
          'name':name.text,
          'email':email.text,
          'uid': result.user.uid

        });
      });


    }catch(e){
      print(e);
    }
  }

  void clearController(){
    name.text = "";
    password.text = "";
    email.text = "";
  }

  Future<Void> _onStateChanged(FirebaseUser firebaseUser)async{
    if(firebaseUser == null){
      _status = Status.Uninitialized;
    }else{
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userService.getUserById(firebaseUser.uid);
    }
  }


}