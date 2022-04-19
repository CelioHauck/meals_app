import 'dart:convert';

class MealFilters {
  final bool glutten;
  final bool lactose;
  final bool vegan;
  final bool vegetarian;
  MealFilters({
    required this.glutten,
    required this.lactose,
    required this.vegan,
    required this.vegetarian,
  });

  MealFilters copyWith({
    bool? glutten,
    bool? lactose,
    bool? vegan,
    bool? vegetarian,
  }) {
    return MealFilters(
      glutten: glutten ?? this.glutten,
      lactose: lactose ?? this.lactose,
      vegan: vegan ?? this.vegan,
      vegetarian: vegetarian ?? this.vegetarian,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'glutten': glutten});
    result.addAll({'lactose': lactose});
    result.addAll({'vegan': vegan});
    result.addAll({'vegetarian': vegetarian});

    return result;
  }

  factory MealFilters.fromMap(Map<String, dynamic> map) {
    return MealFilters(
      glutten: map['glutten'] ?? false,
      lactose: map['lactose'] ?? false,
      vegan: map['vegan'] ?? false,
      vegetarian: map['vegetarian'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MealFilters.fromJson(String source) =>
      MealFilters.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MealFilters(glutten: $glutten, lactose: $lactose, vegan: $vegan, vegetarian: $vegetarian)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MealFilters &&
        other.glutten == glutten &&
        other.lactose == lactose &&
        other.vegan == vegan &&
        other.vegetarian == vegetarian;
  }

  @override
  int get hashCode {
    return glutten.hashCode ^
        lactose.hashCode ^
        vegan.hashCode ^
        vegetarian.hashCode;
  }
}
