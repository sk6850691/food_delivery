import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/scr/models/restaurants.dart';
import 'package:transparent_image/transparent_image.dart';

import 'loading.dart';
class RestaurantWidget extends StatelessWidget {
  final RestaurantModel restaurantModel;

  const RestaurantWidget({Key key, this.restaurantModel}) : super(key: key);



  @override
  Widget build(BuildContext context) {



    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Positioned.fill(child: Align(
                    alignment: Alignment.center,
                    child: Loading(),
                  ),),
                  Center(
                    child: FadeInImage.memoryNetwork(placeholder: kTransparentImage,image: restaurantModel.image,),
                  )
                ],

              ),
            ),

          )
        ],
      ),
    );
  }
}
