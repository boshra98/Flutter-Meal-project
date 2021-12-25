import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_meal_app/screens/filters_screen.dart';
import 'package:my_meal_app/screens/login_screen.dart';

class MainDrawer extends StatelessWidget {
  // const MainDrawer({Key? key}) : super(key: key);
 Widget buildListTile(String title,IconData icon,Function tapHandler){
   return ListTile(
     leading: Icon( icon,
       size: 26,
     ),
     title: Text(
       title,
       style: TextStyle(
           fontSize: 24,
           fontWeight: FontWeight.bold,
           fontFamily: 'RobotoCondensed'),
     ),
     onTap: tapHandler,
   );
 }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'cooking up',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meal', Icons.restaurant,(){Navigator.of(context).pushNamed('/');}),
          buildListTile('Filters', Icons.settings,(){Navigator.of(context).pushNamed(FiltersScreen.routeName);}),
          buildListTile('Log in', Icons.account_circle_outlined, (){Navigator.of(context).pushNamed(LoginScreen.routeName);})
        ],
      ),
    );
  }
}
