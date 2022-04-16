import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-detail';

  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealsId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealsId,
        ),
      ),
      body: Center(
        child: Text('The meal - $mealsId'),
      ),
    );
  }
}
