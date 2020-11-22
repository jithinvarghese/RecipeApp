import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favriteMeals;
  FavoritesScreen(this.favriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favriteMeals[index].id,
            title: favriteMeals[index].title,
            imageUrl: favriteMeals[index].imageUrl,
            affordability: favriteMeals[index].affordability,
            complexity: favriteMeals[index].complexity,
            duration: favriteMeals[index].duration,
          );
        },
        itemCount: favriteMeals.length,
      );
    }
  }
}
