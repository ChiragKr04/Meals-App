import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String routeName = "/meal-details-screen";

  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealId = routeArgs["id"];
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (element) => mealId == element.id,
    );

    Widget buildSectionTitle(BuildContext context, String title) {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                child: Image.network(
                  selectedMeal.imageUrl,
                ),
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            Container(
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(10),
              height: 150,
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Container(
                    child: Card(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Text(
                          selectedMeal.ingredients[index],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, "Steps"),
            Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: 250,
              width: double.infinity,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Container(
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text("${index + 1}"),
                          ),
                          title: Text("${selectedMeal.steps[index]}"),
                        ),
                        Divider(),
                      ],
                    ),
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
