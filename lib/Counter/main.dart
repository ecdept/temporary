import 'package:flutter/material.dart';
import 'package:temporary/Counter/home.dart';
import 'package:temporary/Counter/search.dart';
import 'package:temporary/Counter/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {


  ValueNotifier<int> counter = ValueNotifier(0);
  ValueNotifier<int> index = ValueNotifier(0);
  final list = [Myaccount(),
    Search(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ValueListenableBuilder(
          valueListenable: index,
          builder: (context, int n, child) {
            return Scaffold(
                body: Column(
                  children: [
                    Container(
                      child: Center(
                        child: ValueListenableBuilder(
                          valueListenable: counter,
                          builder: (BuildContext context, int n,
                              Widget? child) {
                            return Text(n.toString(),
                              style: TextStyle(fontSize: 40),);
                          },
                        ),
                      ),
                    ),
                    ElevatedButton(onPressed: () {
                      counter.value = 0;
                    }, child: Text('Clear')
                    ),
                    ElevatedButton(onPressed: () {
                      showBottomsheet(context);
                    }, child: Text('Bottom Sheet')
                    ),
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    counter.value = counter.value + 1;
                  },
                  child: Icon(Icons.add),
                ),
                bottomNavigationBar: BottomNavigationBar(

                  currentIndex: n,
                  onTap: (value) {
                    index.value = value;
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (coxt) => list[value]),);

                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.search), label: 'Search'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.settings), label: 'Settings'),
                  ],
                )
            );
          },
        ));
  }

  Future<void> showBottomsheet(BuildContext context) async {
    showModalBottomSheet(context: (context), builder: (context) {
      return Container(
        width: double.infinity,
        height: 400,
        color: Colors.orange[100],
        child: Text('hai'),
      );
    });
  }


}



