import 'package:flutter/material.dart';
import 'package:temporary/student_database/screens/widgets/addstudentdetails.dart';
import 'package:temporary/student_database/screens/widgets/liststudentdetails.dart';

class StudentList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(title: Text('Student DataBase'),centerTitle: true,),
            body: Column(
              children: [
                AddStudentDetails(),
                 ListStudentDetails(),

              ],
            ),
          ),
       );
  }
}
