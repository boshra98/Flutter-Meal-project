
import 'package:flutter/material.dart';
import 'package:my_meal_app/widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'favorit_screen.dart';
class TabsScreen extends StatefulWidget {
  // const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List<Map<String,Object>>_pages=[
    {'page': CategoriesScreen(),
      'title':'categories',

    } ,
    {'page': FavoritesScreen(),
      'title':'your Favorites',
    } ,
  ];


  int _selectedPageIndex=0;

  // static var title;
  void _selectPage(int value){
    setState(() {
      _selectedPageIndex=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title']),),
      body:_pages [_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor:Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            title: Text('Catergories'),
    ),

          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorit'),
          ),

        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
