import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/scr/models/category.dart';
import 'package:food_delivery/scr/widgets/loading.dart';
import 'package:transparent_image/transparent_image.dart';
import '../helpers/style.dart';
import 'custom_text.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryWidget({Key key, this.categoryModel}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(6),
     child: Stack(
       children: [
         Container(
           width: 100,
           height: 160,
           child: ClipRRect(
               child: Stack(
                 children: [
                   Positioned.fill(
                     child: Align(
                       alignment: Alignment.center,
                       child: Loading(),
                     ),
                   ),
                   Center(
                     child: FadeInImage.memoryNetwork(placeholder: kTransparentImage,image: categoryModel.image,),
                   )
                 ],
               )


           ),
         ),
         Container(

           height: 140,
           width: 140,
           decoration: BoxDecoration(
               borderRadius: BorderRadius.only(
                 bottomRight: Radius.circular(20),
                 bottomLeft:Radius.circular(20) ,
               )
           ),),
         Positioned.fill(
           child: Align(
             alignment: Alignment.center,
             child: CustomText(
               text: categoryModel.name
             ),
           ),
         )
       ],
     ),
   );

  }
}
