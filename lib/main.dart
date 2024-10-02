import 'package:discover_recipes/data/dummy_data.dart';
import 'package:discover_recipes/models/meal.dart';
import 'package:discover_recipes/models/settings.dart';
import 'package:discover_recipes/screens/categories_meals_screen.dart';
import 'package:discover_recipes/screens/meal_details_screen.dart';
import 'package:discover_recipes/screens/settings_screen.dart';
import 'package:discover_recipes/screens/tabs_screen.dart';
import 'package:discover_recipes/utils/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:discover_recipes/screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavoriteMeal(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

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
        AppRoutes.HOME: (context) => TabsScreen(
              favoriteMeals: _favoriteMeals,
            ),
        AppRoutes.CATEGORIES_MEALS: (context) =>
            CategoriesMealsScreen(meals: _availableMeals),
        AppRoutes.MEAL_DETAILS: (context) => MealDetailsScreen(
              onFavoriteMealChanged: _toggleFavoriteMeal,
              isFavorite: _isFavorite,
            ),
        AppRoutes.SETTINGS: (context) => SettingsScreen(
              settings: settings,
              onSettingsChanged: _filterMeals,
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return const CategoriesScreen();
        });
      },
    );
  }
}
