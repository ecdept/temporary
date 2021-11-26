import 'package:flutter/material.dart';
import 'package:temporary/student_database/db/model/data_model.dart';

ValueNotifier<List<StudentModel>> studentlistNotifier=ValueNotifier([]);

void addStudent(StudentModel value){
  studentlistNotifier.value.add(value);
  studentlistNotifier.notifyListeners();
 // print(value.toString());
}


