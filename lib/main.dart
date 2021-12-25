import 'package:flutter/material.dart';
import 'package:my_meal_app/dummy_data.dart';
import 'package:my_meal_app/models/meal.dart';
import 'package:my_meal_app/screens/category_meals_screen.dart';
import 'package:my_meal_app/screens/filters_screen.dart';
import 'package:my_meal_app/screens/login_screen.dart';
import 'package:my_meal_app/screens/meal-details-screen.dart';
import 'package:my_meal_app/screens/tabs_screen.dart';
// import '';
import './screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeal=DUMMY_MEALS;
  // List<Meal> _availableMeals = DUMMY_MEALS;
  void _setFilters(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;
      _availableMeal = DUMMY_MEALS.where((meals) {
        if (_filters['gluten'] && !meals.isGlutenFree) {
          return false; //delete it
        }
        if (_filters['lactose'] && !meals.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meals.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meals.isVegan) {
          return false;
        }
        return true;

      }).toList();
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter deomo",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(color: Color.fromRGBO(20, 20, 50, 1)),
            body2: TextStyle(color: Color.fromRGBO(20, 20, 50, 1)),
            title: TextStyle(
                fontSize: 24,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold)),
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeal),
        MealDetailScreen.routName: (context) => MealDetailScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(_setFilters),
        LoginScreen.routeName: (context) => LoginScreen(),
      },
    );
  }
}
