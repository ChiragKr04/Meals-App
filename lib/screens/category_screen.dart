import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

import '../widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: GridView(
        children: DUMMY_CATEGORIES
            .map(
              (catItem) => CategoryItem(
                catItem.title,
                catItem.color,
                catItem.id,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}
