import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:english_words/english_words.dart';
class MyApp3 extends StatelessWidget {
  const MyApp3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListViewBasic(),
    );
  }
}
class ListViewBasic extends StatefulWidget {
  const ListViewBasic({Key? key}) : super(key: key);

  @override
  _ListViewBasicState createState() => _ListViewBasicState();
}

class _ListViewBasicState extends State<ListViewBasic> {
  var data= generateWordPairs().take(100);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List View Basic - Lecture3"),
        ),
        body: Center(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext content, int index) {
                  var wp = data.elementAt(index);
                  return Card(
                    elevation: 6,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.red,
                        child: Text("${index+1}", style: TextStyle(fontSize: 15),)),


                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.add_shopping_cart),),
                          ],
                        ),

                       title: Text(wp.asPascalCase, style: TextStyle(color: Colors.red, fontSize: 20),),
                  )));
                })
        )
    );
  }
}