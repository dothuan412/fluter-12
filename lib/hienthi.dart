import 'package:flutter/material.dart';
import 'package:nhom2dothuan/store.dart';


class MyApp7 extends StatelessWidget {
  const MyApp7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: show(),
    );
  }
}
class show extends StatefulWidget {
  const show({Key? key}) : super(key: key);

  @override
  _showState createState() => _showState();
}

class _showState extends State<show> {
  late Future<List<Store>> ls;
  late List<Store> _stores;
  late bool _loading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading.' : 'List'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(shrinkWrap: true,
            itemCount: null == _stores ? 0 : _stores.length,
            itemBuilder: (context,index){
              Store store = _stores[index];
              return Container(
                padding: EdgeInsets.all(2), height: 250,
                child: Card(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: Image.network(store.image),),
                          Expanded(
                              flex: 3,
                              child: SizedBox(
                                  width: 400,
                                  //padding: EdgeInsets.all(2),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(store.title, style: const TextStyle(fontWeight:
                                        FontWeight.bold)),
                                        Text("Price: " + store.price.toString(),style: TextStyle( color: Colors.red),),
                                        Text(store.description),

                                        Text("Rate:"+store.rating.rate.toString() ),
                                        Text("Count:"+store.rating.count.toString()),

                                      ],         ),)
                              )
                          ),
                          Expanded(

                            child: IconButton(onPressed: () =>   Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SoLuong()),

                            ),icon:  const Icon(Icons.add_shopping_cart ),),)
                        ]
                    )

    ));

     })));

  }
}
class SoLuong extends StatelessWidget {
  const SoLuong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Chon so luong:"),
      ),
      body: Center(
        child: Column(
            children: [
              SizedBox(height: 50,),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    icon: Icon(Icons.add),
                    hintText: "Nhap so luong can mua",
                    labelText:"So luong"
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back list'),
              ),]),

      ),
    );
  }
}