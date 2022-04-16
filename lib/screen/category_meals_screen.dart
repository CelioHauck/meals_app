import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/category.dart';

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
            return MealItem(
              id: mealsWithCategory[index].id,
              title: mealsWithCategory[index].title,
              imageUrl: mealsWithCategory[index].imageUrl,
              duration: mealsWithCategory[index].duration,
              complexity: mealsWithCategory[index].complexity,
              affordability: mealsWithCategory[index].affordability,
            );
          },
          itemCount: mealsWithCategory.length,
        ));
  }
}
