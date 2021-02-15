import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  Widget build(BuildContext context) {
    return favoriteMeals.isNotEmpty
        ? Center(
            child: Container(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return MealItem(
                    mealsList: favoriteMeals[index],
                    removeItem: null,
                  );
                },
                itemCount: favoriteMeals.length,
              ),
            ),
          )
        : Center(
            child: Text("No Favorite Meals - start adding some!"),
          );
  }
}
