import 'package:discover_recipes/components/meal_item.dart';
import 'package:discover_recipes/models/meal.dart';
import 'package:flutter/material.dart';

class FavoriteMealsScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteMealsScreen({super.key, required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('Refeições favoritas'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: favoriteMeals[index]);
        },
      );
    }
  }
}
