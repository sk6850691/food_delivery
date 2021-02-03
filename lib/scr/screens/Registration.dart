import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/scr/providers/user.dart';
import 'package:food_delivery/scr/screens/Home.dart';
import 'package:food_delivery/scr/widgets/loading.dart';
import 'package:provider/provider.dart';
class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider  = Provider.of<User>(context);
    return Scaffold(
      body: authProvider.status == Status.Authenticating? Loading():SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: authProvider.email,
            ),
            TextFormField(
              controller: authProvider.password,
            ),
            TextFormField(
              controller: authProvider.name,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 40,
                child: MaterialButton(
                  color: Colors.blue,



                  onPressed: ()async{
                    if(!await authProvider.signUp()

                    ){
                      key.currentState.showSnackBar(SnackBar(content: Text('registration failed')));
                    }
                    authProvider.clearController();
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Home()));

                  },
                ),
              ),
            )
          ],
        ),

      ),

    );
  }
}
