import 'package:flutter/material.dart';
import 'package:food_delivery/scr/helpers/style.dart';

class CustomText extends StatelessWidget {

  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  CustomText({ this.text,this.size,this.color,this.weight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: TextStyle(fontSize: size??16,color:color??black, )

    );
  }
}
