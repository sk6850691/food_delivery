import 'package:flutter/material.dart';
import 'package:food_delivery/scr/providers/auth.dart';
import 'package:food_delivery/scr/screens/Home.dart';
import 'package:food_delivery/scr/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery/scr/providers/auth.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthProvider authProvider = AuthProvider.initialize();

  final _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.white,
      body: authProvider.status == Status.Authenticating?Loading()
          :SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:
              100,)
            ,TextFormField(
              controller: authProvider.email,
            ),
            TextFormField(
              controller: authProvider.password,
            ),
            FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: authProvider.signUp,
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: ()async{
                if(!await authProvider.signIn()){
                  _globalKey.currentState.showSnackBar(
                    SnackBar(content: Text('login failed'),)
                  );

return;
                }
                authProvider.clearController();
                Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>Home()));
              },
            )
          ],
        ),
      ),
    );
  }
}
