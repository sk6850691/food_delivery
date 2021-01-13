import 'package:flutter/material.dart';
import 'package:food_delivery/scr/providers/auth.dart';
import 'package:food_delivery/scr/widgets/custom_text.dart';
import 'package:provider/provider.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [


          Stack(
            children: [
            IconButton(
              onPressed: authProvider.signOut,
              icon: Icon(Icons.exit_to_app),
            ),
              Drawer(child: ListView(

                children: [
                  UserAccountsDrawerHeader(
                    accountName: CustomText(text: authProvider.userModel?.name,),
                    accountEmail: CustomText(text: authProvider.userModel?.email,),
                  )
                ],
              ),)


          ]
          )

        ],

       
        backgroundColor: Colors.blue,

      ),


    );
  }
}
