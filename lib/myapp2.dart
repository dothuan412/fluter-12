import 'package:flutter/material.dart';
class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tieu de",
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

}
class _HomePageState extends State<HomePage> {
  int count = 0;
  String greeting = "Xin chao buoi sang";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trang chu", style: TextStyle(fontSize: 20, color: Colors.black),),
        leading: Icon(Icons.home, size: 30,),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              greeting = "Bay gio la buoi toi";
            });
          }, icon: Icon(Icons.access_alarms_rounded))
        ],
      ),
      body: Center(
        child: Text(" $greeting: $count ",style: TextStyle(fontSize: 30)),
      ),
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.amber,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: () {

                }, icon: Icon(Icons.call, size: 40, color: Colors.black,)),
                IconButton(onPressed: () {

                }, icon: Icon(Icons.account_circle, size: 40, color: Colors.black,))
              ],
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
            print(count);
          });

        },
        child: Icon(Icons.add),
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.black,

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

