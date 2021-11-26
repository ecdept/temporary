import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temporary/loginpage/loginpage.dart';

class FirstPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('first page'),actions: [
          IconButton(onPressed: ()async {
            final sharedpref = await SharedPreferences.getInstance();
            await sharedpref.clear();
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
          }, icon: Icon(Icons.add_to_home_screen))
        ],),
        body: Container(
          color: Colors.amber,

        ),
      ),
    );
  }
}
