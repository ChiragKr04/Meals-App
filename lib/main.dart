import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import './screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        canvasColor: Colors.white,
        primarySwatch: Colors.orange,
        accentColor: Colors.blue,
        fontFamily: "Mulish",
      ),
      // home: CategoryScreen(),
      // This '/' is convention to set the first page that will load when app launches
      initialRoute: "/",
      routes: {
        // Giving screenWidget fot the initial route
        "/": (ctx) => TabsScreen(),
        // Here we can give ID to our screens for .pushNamed() functions
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
      },
    );
  }
}
