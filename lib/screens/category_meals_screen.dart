import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  /*final String categoryName;

  CategoryMealsScreen({
    @required this.categoryName,
  });*/

  static const String routeName = "/category-meals-screen";
  final List<Meal> availableMeal;
  CategoryMealsScreen(this.availableMeal);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!isLoaded) {
      // Here using ModalRoute object we can get passed arguments as arguments are of type Map we need to add "as Map<_, _>"
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      // Accessing simple list of type routeArgs
      categoryTitle = routeArgs["title"];
      final String categoryId = routeArgs["id"];
      displayedMeals = widget.availableMeal.where((element) {
        return element.categories.contains(categoryId);
      }).toList();
      isLoaded = true;
    }
    super.didChangeDependencies();
  }

  void removeItem(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  Widget build(BuildContext context) {
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
          return MealItem(
            mealsList: displayedMeals[index],
            removeItem: removeItem,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
