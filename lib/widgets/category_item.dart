import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem(
    this.title,
    this.color,
    this.id,
  );

  // Function for going to next screen (intent in android)
  void jumpToCategoryMealScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      // Name of or Id of the screen where we want to go i.e. of CategoryMealsScreen
      // categoryMealsScreenId id Id of the screen
      CategoryMealsScreen.routeName,
      // Passing arguments to next screen
      arguments: {
        "title": title,
        "id": id,
      },
    );
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        jumpToCategoryMealScreen(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color,
              color.withOpacity(0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
