import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
//   // const FiltersScreen({Key? key}) : super(key: key);
  static const routeName='/login';
//
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
//
//
class _LoginScreenState extends State<LoginScreen> {
//   bool _glutenFree=false;
//   bool _lactoseFree=false;
//   bool _vegan=false;
//   bool _vegetarian=false;
//   Widget buildswitchListTile(String title,String description,bool currentvalue,Function updateValue ){
//     return SwitchListTile( title:Text(title),value: currentvalue,subtitle: Text(description) ,onChanged: updateValue);
//   }
//   @override
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(
    title: Text('log-in'),
    ),
    body: Padding(
    padding: EdgeInsets.all(10),
    child: ListView(
    children: <Widget>[
    Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(10),
    child: Text(
    'Meal App',
    style: TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.w500,
    fontSize: 30),
    )),
    Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(10),
    child: Text(
    'Sign in',
    style: TextStyle(fontSize: 20),
    )),
    Container(
    padding: EdgeInsets.all(10),
    child: TextField(
    controller: nameController,
    decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'User Name',
    ),
    ),
    ),
    Container(
    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: TextField(
    obscureText: true,
    controller: passwordController,
    decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Password',
    ),
    ),
    ),
    FlatButton(
    onPressed: (){
    //forgot password screen
    },
    textColor: Colors.blue,
    child: Text('Forgot Password'),
    ),
    Container(
    height: 50,
    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: RaisedButton(
    textColor: Colors.white,
    color: Colors.blue,
    child: Text('Login'),
    onPressed: () {
    print(nameController.text);
    print(passwordController.text);
    },
    )),
    Container(
    child: Row(
    children: <Widget>[
    Text('Does not have account?'),
    FlatButton(
    textColor: Colors.blue,
    child: Text(
    'Sign in',
    style: TextStyle(fontSize: 20),
    ),
    onPressed: () {
    //signup screen
    },
    )
    ],
    mainAxisAlignment: MainAxisAlignment.center,
    ))
    ],
    )));
  }
}