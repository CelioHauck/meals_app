import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-detail';

  const MealDetailScreen({Key? key}) : super(key: key);

  //TIP: Se esse app fosse um app que mudasse de tema, uma melhoria de performance
  //seria transformar esse build em um proprio widget para evitar que o metodo
  //do build desse widget fosse trigado quando um tema fosse alterado.
  Widget buildSectionTitle(String title, BuildContext ctx) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  Widget _buildContainer({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealsId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((e) => e.id == mealsId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(
              'Ingredients',
              context,
            ),
            _buildContainer(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      selectedMeal.ingredients[index],
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(
              'Steps',
              context,
            ),
            _buildContainer(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
