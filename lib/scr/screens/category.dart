import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/scr/helpers/screenNavigation.dart';
import 'package:food_delivery/scr/models/category.dart';
import 'package:food_delivery/scr/providers/product.dart';
import 'package:food_delivery/scr/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Loading(),
                  ),
                ),
                ClipRRect(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: CategoryModel.IMAGE,
                    height: 160,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 10,

            ),
            Column(
              children: productProvider.productByCategory.map((item)=>
              GestureDetector(
                onTap:(){changeScreen(context,
                    Details()
                );} ,
              )).toList()
            )
          ],
        ),
      ),
    );
  }
}
