import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/scr/helpers/screenNavigation.dart';
import 'package:food_delivery/scr/models/category.dart';
import 'package:food_delivery/scr/providers/category.dart';
import 'package:food_delivery/scr/providers/product.dart';

import 'package:food_delivery/scr/providers/restaurantprovider.dart';
import 'package:food_delivery/scr/providers/user.dart';
import 'package:food_delivery/scr/widgets/categories.dart';
import 'package:food_delivery/scr/widgets/custom_text.dart';
import 'package:food_delivery/scr/widgets/featured_products.dart';
import 'package:food_delivery/scr/widgets/restaurantwidget.dart';
import 'package:provider/provider.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Food App"),
        elevation: 1,
        actions:<Widget> [


          Stack(children:<Widget> [
             IconButton(
              icon: Icon(Icons.add_a_photo),
            ),
            Positioned(
              top :12,
              right: 50,
              child: Container(
                height: 10,
                width: 10,
              ),
            )
          ]),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.wallet_giftcard),
                onPressed: (){},
              ),
              Positioned(
                top: 18,
                right: 12,
                child: Container(
                  height: 10,
                  width: 10,

                ),
              )
            ],
          ),],
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountEmail: CustomText(text: user.userModel?.email,),
              accountName: CustomText(text: user.userModel?.name,),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.home),
              title: CustomText(text: "Home",),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.fastfood),
              title: CustomText(text:"Food I Like"),
            ),
            ListTile(onTap: (){},
            leading:Icon(Icons.restaurant) ,
            title: CustomText(text: "Liked Restaurant",),),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.bookmark_border),
              title: CustomText(text: "My orders",),
            ),
            ListTile(
              onTap: (){},
              leading:Icon(Icons.settings),
              title: CustomText(text: "Settings",),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.shopping_cart),
              title: CustomText(text: "Cart",),
            ),


          ],
        ),
      ),
      body: SafeArea(
        child: ListView(children:<Widget>[

            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(30))),

              child: Padding(
                padding: const EdgeInsets.only(top:8 ,bottom: 8,right: 8,left:8 ),
                child: Container(
                  child: ListTile(
                    leading: Icon(
                      Icons.search
                    ),
                    title: TextField(

                    ),
                    trailing: Icon(
                      Icons.filter),),

                ),),),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryProvider.categories.length,
                itemBuilder: (context,index){
                  return
                    GestureDetector(
                      onTap:()async{
                        productProvider.loadProductByCategory();
                        changeScreenReplacement(context,Category)
                      },
                      child: CategoryWidget(
                       categoryModel : categoryProvider.categories[index],),
                    );},)),
            SizedBox(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget> [



                 CustomText(text: "Featured",size: 20,)
                ],
              ),
            ),
            Featured(),
            SizedBox(
              height: 10,
            ),
            Column(

              children: restaurantProvider.restaurant.map((item) => GestureDetector(
                onTap: (){},
                child: RestaurantWidget(
                  restaurantModel: item,
                ),

              )).toList()



            ),




              ],
        ),
      )
    );





  }
}
