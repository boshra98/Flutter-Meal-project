import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/Category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(

            padding: const  EdgeInsets.all(25),
            children: DUMMY_CATEGORIES
                .map((catData) =>
                    CategoryItem(catData.id, catData.title, catData.color),
            )
                .toList(),
          // children: [RaisedButton(onPressed: (){},color: Colors.red,),
          //   RaisedButton(onPressed: (){},color: Colors.orange,),
          //   RaisedButton(onPressed: (){},color: Colors.blue,),
          //   RaisedButton(onPressed: (){},color: Colors.green,),
          // ],
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),

      );

  }
}
