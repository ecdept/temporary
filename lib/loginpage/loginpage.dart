import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temporary/loginpage/first_page.dart';
import 'package:temporary/loginpage/splashscreen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final username= TextEditingController();

final password= TextEditingController();
var counter= 0;
final mykey=GlobalKey<FormState>();
String error = ' ';
 bool match = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: mykey,
              child: Column(
                children: [
                 // padding:Padding(padding: EdgeInsets.all(20)),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (value){
                      if(value==null || value.isEmpty)
                        return 'empty';
                    },
                    decoration: InputDecoration(border: OutlineInputBorder(),
                        hintText:'user name' ,
                    ),
                    controller:username ,

                  ),
                SizedBox(height: 20,),
                  TextFormField(
                    validator: (value){
                      if(value==null|| value.isEmpty)
                        return 'empty';
                    },
                    obscureText: true,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      hintText:'password' ,
                    ),
                    controller: password,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Visibility(visible:!match,child: Text(error)),

                      ElevatedButton(onPressed:
                          (){
                          if(mykey.currentState!.validate()) {
                            checkLogin(context);
                          }
                          else
                            {
                              //
                            }

                      },
                          child: Text('login'),

                      ),

                    ],
                  ),
                  Text(error),
                  SizedBox(height: 20),
                  Text (counter.toString()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

   void checkLogin(BuildContext context)async
  {
    final user=username.text;
    final pwd =password.text;
    if (user==pwd )
    {
        final sharedpref= await SharedPreferences.getInstance();
        await sharedpref.setBool(SAVEDKEY, true);

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> FirstPage() ));

    }
    else
      //snackbar
      {

        ScaffoldMessenger.of(context).
        showSnackBar(SnackBar(content: Text(error),duration:Duration(seconds: 5),));

       // alert dialog

        // showDialog(context: context, builder: (context){
        //   return AlertDialog(title: Text('message'),content: Text(error),
        //   actions: [
        //     TextButton(onPressed: ()
        //     {
        //       Navigator.of(context).pop();
        //     }, child: Text('close'),)
        //   ],);
        // });
        setState(() {
           error= 'not match';
           match= false;
           counter=counter+1;
        });

      }

  }
}
