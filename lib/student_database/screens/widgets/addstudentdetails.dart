import 'package:flutter/material.dart';
import 'package:temporary/student_database/db/functions/db_functions.dart';
import 'package:temporary/student_database/db/model/data_model.dart';
import 'package:temporary/student_database/studentlist.dart';

final Mykey=GlobalKey<FormState>();
final studentname=TextEditingController();
final age=TextEditingController();

class AddStudentDetails extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Form(
      key: Mykey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: studentname,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'enter student name';
                } else {
                  print('ok');
                }
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'student name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: age,
              validator: (value) {
                if (value == null || value.isEmpty) return 'enter Student Age';
              },
              decoration:
                  InputDecoration(border: OutlineInputBorder(), hintText: 'age'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (Mykey.currentState!.validate()) {
                 addStudentButton();
                }
              },
              child: Text('Add student Data')),
        ],
      ),
    );
  }
  Future<void> addStudentButton()async{
    final name=studentname.text;
    final Age=age.text;
    final student=StudentModel(name: name, age: Age);
    addStudent(student);
     


  }
}
