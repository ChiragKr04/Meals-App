import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  /*final String categoryName;

  CategoryMealsScreen({
    @required this.categoryName,
  });*/

  static const String routeName = "/category-meals-screen";

  Widget build(BuildContext context) {
    // Here using ModalRoute object we can get passed arguments as arguments are of type Map we need to add "as Map<_, _>"
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    // Accessing simple list of type routeArgs
    final String categoryTitle = routeArgs["title"];
    final String categoryId = routeArgs["id"];
    final categoryMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
