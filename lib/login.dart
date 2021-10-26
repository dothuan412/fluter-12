import 'package:flutter/material.dart';
class MyApp5 extends StatelessWidget {
  const MyApp5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login() ,
    );

  }
}
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var fkey = GlobalKey<FormState>();
  var txtUserName = TextEditingController();
  var txtPassWord = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: fkey,
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text("Sign In", style: TextStyle(fontSize: 30, color: Colors.deepOrangeAccent),),
            TextFormField(
              controller: txtUserName,
              validator: (value){
                if (value == null || value.isEmpty)
                  return "Please enter your user name";
                else
                  return null;
              },
              decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Input your user name",
                  labelText: "User Name"
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: txtPassWord,
              validator: (value){
                if(value == null || value.isEmpty)
                  return "Password cannot empty";
                else if(value.length < 6)
                  return "Length minimu of password is 6";
                else
                  return null;
              },
              decoration: InputDecoration(
                  icon: Icon(Icons.lock_open),
                  hintText: "Input your password",
                  labelText: "Password"
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  if (fkey.currentState!.validate())
                  {
                    print("Oke");
                    var userName = txtUserName.text;
                    var passWord = txtPassWord.text;
                    var alert = AlertDialog(
                      content: Text("${userName}, ${passWord}"),
                    );
                    showDialog(context: context, builder: (context){
                      return alert;
                    });
                  }
                  else {
                    print("Not Oke");
                  }
                },
                child: Text("Login")),
          ],
        ),
      ),
    );
  }
}