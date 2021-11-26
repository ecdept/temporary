import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temporary/loginpage/first_page.dart';

import 'loginpage.dart';
const SAVEDKEY='userloggedin';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
 @override
  void initState() {
   Checkprefrnce();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Image.asset('assets/images.png',height: 300,),
      ),
    );
  }



  Future<void> gotoLogin() async{
  await Future.delayed(Duration(seconds: 3));
Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()),);
  }

 Future<void>Checkprefrnce()async{
  final sharedpref = await SharedPreferences.getInstance();
  final userloggedin= sharedpref.getBool(SAVEDKEY);
  if(userloggedin==null||userloggedin==false)
  {
    gotoLogin();
  }
  else
    {
      await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FirstPage()));
  }
 }
}




