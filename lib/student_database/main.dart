import 'package:flutter/material.dart';
import 'package:temporary/student_database/studentlist.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StudentList(),
    );
  }
}
