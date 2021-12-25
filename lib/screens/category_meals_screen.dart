import 'package:flutter/material.dart';
import 'package:my_meal_app/dummy_data.dart';
import 'package:my_meal_app/models/meal.dart';
import 'package:my_meal_app/widgets/meal-item.dart';

class CategoryMealsScreen extends StatefulWidget {
  // const categoryMealsScreen({Key? key}) : super(key: key);
  static const routeName = 'category-meals';
  final List<Meal> availableMeal;
  CategoryMealsScreen(this.availableMeal);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

// ignore: camel_case_types
class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;
 void didChangeDependencies(){
   if (!_loadedInitData) {
     final routeArg = ModalRoute
         .of(context)
         .settings
         .arguments as Map<String, String>;
     final categoryId = routeArg['id'];
     categoryTitle = routeArg['title'];
     displayedMeals = widget.availableMeal.where((meal) {
       return meal.categories.contains(categoryId);
     }).toList();
     _loadedInitData = true;
   }

   super.didChangeDependencies();
 }

    void _removeMeal(String mealId) {
      setState(() {
        displayedMeals.removeWhere((meal) => meal.id == mealId);
      });
    }


    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return
              // return Text(categoryMeals[index].title);
              // ignore: missing_return
              MealItem(
            id: displayedMeals[index].id,
            imageUrl: displayedMeals[index].imageUrl,
            title: displayedMeals[index].title,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
                removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}









