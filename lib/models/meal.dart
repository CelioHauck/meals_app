import 'package:collection/collection.dart';

enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

//TIP: Essa classe n foi feita dá melhor maneira possivel, o foco desse projeto é
// estudar a navegação
class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  Meal copyWith({
    String? id,
    List<String>? categories,
    String? title,
    String? imageUrl,
    List<String>? ingredients,
    List<String>? steps,
    int? duration,
    Complexity? complexity,
    Affordability? affordability,
    bool? isGlutenFree,
    bool? isLactoseFree,
    bool? isVegan,
    bool? isVegetarian,
  }) {
    return Meal(
      id: id ?? this.id,
      categories: categories ?? this.categories,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
      duration: duration ?? this.duration,
      complexity: complexity ?? this.complexity,
      affordability: affordability ?? this.affordability,
      isGlutenFree: isGlutenFree ?? this.isGlutenFree,
      isLactoseFree: isLactoseFree ?? this.isLactoseFree,
      isVegan: isVegan ?? this.isVegan,
      isVegetarian: isVegetarian ?? this.isVegetarian,
    );
  }

  @override
  String toString() {
    return 'Meal(id: $id, categories: $categories, title: $title, imageUrl: $imageUrl, ingredients: $ingredients, steps: $steps, duration: $duration, complexity: $complexity, affordability: $affordability, isGlutenFree: $isGlutenFree, isLactoseFree: $isLactoseFree, isVegan: $isVegan, isVegetarian: $isVegetarian)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Meal &&
        other.id == id &&
        listEquals(other.categories, categories) &&
        other.title == title &&
        other.imageUrl == imageUrl &&
        listEquals(other.ingredients, ingredients) &&
        listEquals(other.steps, steps) &&
        other.duration == duration &&
        other.complexity == complexity &&
        other.affordability == affordability &&
        other.isGlutenFree == isGlutenFree &&
        other.isLactoseFree == isLactoseFree &&
        other.isVegan == isVegan &&
        other.isVegetarian == isVegetarian;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categories.hashCode ^
        title.hashCode ^
        imageUrl.hashCode ^
        ingredients.hashCode ^
        steps.hashCode ^
        duration.hashCode ^
        complexity.hashCode ^
        affordability.hashCode ^
        isGlutenFree.hashCode ^
        isLactoseFree.hashCode ^
        isVegan.hashCode ^
        isVegetarian.hashCode;
  }
}
