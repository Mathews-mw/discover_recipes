import 'package:discover_recipes/screens/categories_meals_screen.dart';
import 'package:discover_recipes/screens/meal_details_screen.dart';
import 'package:discover_recipes/utils/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:discover_recipes/screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'Descubra receitas',
      theme: ThemeData(
        fontFamily: 'Raleway',
        scaffoldBackgroundColor: const Color.fromRGBO(255, 254, 229, 1),
        appBarTheme: theme.appBarTheme.copyWith(
          backgroundColor: Colors.pink,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        textTheme: theme.textTheme.copyWith(
          titleMedium: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routes: {
        AppRoutes.HOME: (context) => const CategoriesScreen(),
        AppRoutes.CATEGORIES_MEALS: (context) => const CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAILS: (context) => const MealDetailsScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return const CategoriesScreen();
        });
      },
    );
  }
}
