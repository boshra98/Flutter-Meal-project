import 'package:flutter/material.dart';
import 'package:my_meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  // const MealDetailScreen({Key? key}) : super(key: key);
  static const routName = 'meal-detail';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'ingredients',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(10),),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 200,
              width: 300,
              child: ListView.builder(
                  // itemCount: selectedMeal.length,
                  itemBuilder: (ctx, index) => Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          child: Text(selectedMeal.ingredients[index]),
                        ),
                      ),
                itemCount: selectedMeal.ingredients.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){Navigator.of(context).pop(mealId);},
        child: Icon(Icons.delete),
      ), // FloatingActionButton
    );
  }
}
