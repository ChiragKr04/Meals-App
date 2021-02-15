import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_details_screen.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal mealsList;
  final Function removeItem;

  MealItem({
    @required this.mealsList,
    @required this.removeItem,
  });

  String get mealComplexity {
    switch (mealsList.complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "unknown";
    }
  }

  String get mealAffordability {
    switch (mealsList.affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "unknown";
    }
  }

  void jumpToMealsDetails(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailsScreen.routeName,
      arguments: {
        "id": mealsList.id,
      },
    ).then(
      (value) {
        if (value != null) {
          removeItem(mealsList.id);
        }
      },
    );
  }

  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          jumpToMealsDetails(context);
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 6,
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.network(
                        mealsList.imageUrl,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                        ),
                        width: 250,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          mealsList.title,
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.schedule,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${mealsList.duration} min",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.work,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            mealComplexity,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.monetization_on,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            mealAffordability,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
