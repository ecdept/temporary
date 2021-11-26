import 'package:flutter/material.dart';
class Myaccount extends StatelessWidget {

  final Dropdowncontents=['item 1','item 2','item 3','item 4','item 5',];
  int currentvalue=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('dropdown box'),),
      body: SafeArea(
        child: Center(
          child:DropdownButtonFormField(

              onChanged: (e){
              print(e);
              },

              items: Dropdowncontents.map((e){
            return DropdownMenuItem(
                value: e,
                child: Text(e),);
          }).toList()),
        ),
      ),
    );
  }
}
