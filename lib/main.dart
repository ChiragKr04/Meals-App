import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import './screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "vegan": false,
    "vegetarian": false,
    "lactose": false,
  };

  List<Meal> _favoriteMeals = [];

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((element) => element.id == mealId),
        );
      });
    }
  }

  bool _isFavorite(String mealId) {
    return _favoriteMeals.any((element) => mealId == element.id);
  }

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters["gluten"] && !element.isGlutenFree) {
          return false;
        }
        if (_filters["vegan"] && !element.isVegan) {
          return false;
        }
        if (_filters["vegetarian"] && !element.isVegetarian) {
          return false;
        }
        if (_filters["lactose"] && !element.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.blue,
        fontFamily: "Mulish",
      ),
      // home: CategoryScreen(),
      // This '/' is convention to set the first page that will load when app launches
      initialRoute: "/",
      routes: {
        // Giving screenWidget fot the initial route
        "/": (ctx) => TabsScreen(_favoriteMeals),
        // Here we can give ID to our screens for .pushNamed() functions
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.routeName: (ctx) =>
            MealDetailsScreen(_toggleFavorite, _isFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
