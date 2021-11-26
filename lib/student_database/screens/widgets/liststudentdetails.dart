import 'package:flutter/material.dart';
import 'package:temporary/student_database/db/functions/db_functions.dart';
import 'package:temporary/student_database/db/model/data_model.dart';
import 'package:temporary/student_database/studentlist.dart';

class ListStudentDetails extends StatefulWidget {
  //const ListStudentDetails({Key? key}) : super(key: key);

  @override
  _ListStudentDetailsState createState() => _ListStudentDetailsState();
}

class _ListStudentDetailsState extends State<ListStudentDetails> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: studentlistNotifier,
        builder: (BuildContext context,List<StudentModel> value, Widget? child) {
          return ListView.separated(
              itemBuilder: (context, index) {
                final data=value[index];
                return ListTile(
                  title: Text(data.name),
                  subtitle: Text(data.age),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(thickness: 2);
              },
              itemCount: value.length
          );
        },
      ),
    );
  }
}
