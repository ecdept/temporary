import 'package:flutter/material.dart';
import 'package:temporary/loginpage/splashscreen.dart';

void main(){
  runApp(_MyApp());
}
class _MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
