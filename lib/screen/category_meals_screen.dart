import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/category.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
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

  final List<Meal> _availableMeals;

  const CategoryMealsScreen({
    Key? key,
    required List<Meal> availableMeals,
  })  : _availableMeals = availableMeals,
        super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String _categoryTitle;
  List<Meal> _mealsWithCategory = [];

  //DUVIDA: PARECE QUE ISSO N É MAIS NECESSÁRIO.
  var _isloadedInitDate = false;

  //initState n funciona nesse caso pq n é possivel acessar o context no
  // initState, pq o widget nesse ponto do codigo n é criado, o initState
  // é executado primeiro.

  // @override
  // void initState() {
  //   super.initState();

  //   setState(() {
  //     final args = ModalRoute.of(context)!.settings.arguments as Category;
  //     _categoryTitle = args.getTitle();
  //     _mealsWithCategory = dummyMeals
  //         .where(
  //           (meal) => meal.categories.contains(
  //             args.getId(),
  //           ),
  //         )
  //         .toList();
  //   });
  // }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if (!_isloadedInitDate) {
      setState(() {
        final args = ModalRoute.of(context)!.settings.arguments as Category;
        _categoryTitle = args.getTitle();
        _mealsWithCategory = widget._availableMeals
            .where(
              (meal) => meal.categories.contains(
                args.getId(),
              ),
            )
            .toList();
      });
      _isloadedInitDate = true;
    }
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     _mealsWithCategory.removeWhere((element) => element.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _mealsWithCategory[index].id,
            title: _mealsWithCategory[index].title,
            imageUrl: _mealsWithCategory[index].imageUrl,
            duration: _mealsWithCategory[index].duration,
            complexity: _mealsWithCategory[index].complexity,
            affordability: _mealsWithCategory[index].affordability,
            // removeItem: _removeMeal,
          );
        },
        itemCount: _mealsWithCategory.length,
      ),
    );
  }
}
