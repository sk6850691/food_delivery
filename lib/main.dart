import 'package:flutter/material.dart';
import 'package:food_delivery/scr/providers/category.dart';
import 'package:food_delivery/scr/providers/product.dart';
import 'package:food_delivery/scr/providers/restaurantprovider.dart';
import 'package:food_delivery/scr/providers/restaurantprovider.dart';
import 'package:food_delivery/scr/providers/user.dart';
import 'package:food_delivery/scr/screens/Home.dart';
import 'package:food_delivery/scr/screens/Registration.dart';
import 'package:food_delivery/scr/screens/login.dart';
import 'package:food_delivery/scr/widgets/featured_products.dart';
import 'package:food_delivery/scr/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: User.initialize(),),
      ChangeNotifierProvider.value(value: CategoryProvider.initialize(),),
      ChangeNotifierProvider.value(value: RestaurantProvider.initialize(),),
      ChangeNotifierProvider.value(value: ProductProvider.initialize(),)

    ],
    child: MaterialApp(
      home:ScreenController()
    )
  ));




}
class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<User>(context);
    switch(auth.status){
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return Home();
      default:
        return LoginScreen();

    }

  }
}


