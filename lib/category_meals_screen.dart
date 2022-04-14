import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final int _categoryId;
  final String _categoryTitle;

  const CategoryMealsScreen({
    Key? key,
    required int categoryId,
    required String categoryTitle,
  })  : _categoryId = categoryId,
        _categoryTitle = categoryTitle,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: Center(
        child: Text('Receitas da categoria $_categoryTitle'),
      ),
    );
  }
}
