import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

import 'models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final int _categoryId;
  // final String _categoryTitle;

  // const CategoryMealsScreen({
  //   Key? key,
  //   required int categoryId,
  //   required String categoryTitle,
  // })  : _categoryId = categoryId,
  //       _categoryTitle = categoryTitle,
  //       super(key: key);

  const CategoryMealsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Category;
    final mealsWithCategory = dummyMeals
        .where(
          (meal) => meal.categories.contains(
            args.getId(),
          ),
        )
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            args.getTitle(),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Text(mealsWithCategory[index].title);
          },
          itemCount: mealsWithCategory.length,
        ));
  }
}
