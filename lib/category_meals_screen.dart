import 'package:flutter/material.dart';

import 'models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
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
    final args =
        ModalRoute.of<Category>(context)!.settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.getTitle(),
        ),
      ),
      body: Center(
        child: Text('Receitas da categoria ${args.getTitle()}'),
      ),
    );
  }
}
