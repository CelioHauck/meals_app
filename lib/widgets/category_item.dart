import 'package:flutter/material.dart';
import 'package:meals_app/screen/category_meals_screen.dart';

import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final String _id;
  final String _title;
  final Color _color;

  const CategoryItem(
      {Key? key,
      required String title,
      required String id,
      required Color color})
      : _title = title,
        _color = color,
        _id = id,
        super(key: key);

  void _selectCategory(BuildContext context) {
    // TIP: Essa é uma forma de navegar sem ter o routes no main.dart
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoryMealsScreen(
    //         categoryId: _id,
    //         categoryTitle: _title,
    //       );
    //     },
    //   ),
    // );

    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: Category(
        id: _id.toString(),
        title: _title,
        color: _color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          _title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _color.withOpacity(0.7),
              _color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
