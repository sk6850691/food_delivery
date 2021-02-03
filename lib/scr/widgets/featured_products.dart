import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/scr/providers/product.dart';
import 'package:food_delivery/scr/providers/user.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import 'custom_text.dart';
import 'loading.dart';
class Featured extends StatefulWidget {
  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  @override
  Widget build(BuildContext context) {
   final productProvider = Provider.of<ProductProvider>(context);
   final user = Provider.of<User>(context);
    return Container(
        height: 220,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productProvider.products.length,
          itemBuilder: (_,index){

            return Padding(
              padding: EdgeInsets.fromLTRB(12,14,16,12),
              child: GestureDetector(
                onTap: (){

                },
                child: Container(
                  height: 220,
                  width: 220,
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Loading(),
                              ),
                            ),
                            Center(
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: productProvider.products[index].image,
                                height: 126,
                              ),

                            )
                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                              text: productProvider.products[index].name??"id null",
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: (){},
                              child: Container(),
                            ),
                          )
                        ],

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(padding: const EdgeInsets.only(right: 8.0),
                          child: CustomText(

                          ),
                          )

                        ],
                      )
                    ],
                  ),
                ),
              ),

            );
          },
        ),
    );
  }
}
