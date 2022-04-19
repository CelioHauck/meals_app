import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  const FavoriteScreen({
    Key? key,
    required List<Meal> favoriteMeals,
  })  : _favoriteMeals = favoriteMeals,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    }

    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          id: _favoriteMeals[index].id,
          title: _favoriteMeals[index].title,
          imageUrl: _favoriteMeals[index].imageUrl,
          duration: _favoriteMeals[index].duration,
          complexity: _favoriteMeals[index].complexity,
          affordability: _favoriteMeals[index].affordability,
        );
      },
      itemCount: _favoriteMeals.length,
    );
  }
}
