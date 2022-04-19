import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal_filters.dart';
import 'package:meals_app/screen/categories_screen.dart';
import 'package:meals_app/screen/category_meals_screen.dart';
import 'package:meals_app/screen/filters_screen.dart';
import 'package:meals_app/screen/meal_detail_screen.dart';
import 'package:meals_app/screen/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _filters = MealFilters(
    glutten: false,
    lactose: false,
    vegan: false,
    vegetarian: false,
  );

  final List<Meal> _favorite = [];

  var _availableMeals = dummyMeals;

  void _setFilters(MealFilters filters) {
    setState(() {
      _filters = filters;
      _availableMeals = dummyMeals.where((element) {
        return !(_filters.glutten && !element.isGlutenFree) &&
            !(_filters.lactose && !element.isLactoseFree) &&
            !(_filters.vegan && !element.isVegan) &&
            !(_filters.vegetarian && !element.isVegetarian);
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favorite.indexWhere((element) => element.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favorite.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favorite.add(dummyMeals.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favorite.any((element) => element.id == id);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: const CategoriesScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (context) => TabsScreen(
              favoriteMeals: _favorite,
            ),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
              toogleFavorite: _toggleFavorite,
              isMealFavorite: _isMealFavorite,
            ),
        FiltersScreen.routeName: (context) => FiltersScreen(
              currentFilters: _filters,
              saveFilters: _setFilters,
            ),
      },
      //TIP: Uma forma de gerar rotas dinamicas
      onGenerateRoute: (settings) {
        print(settings.arguments);

        // if(settings.name == '/preparacao'){
        //   return ...;
        // } else if(settings.name == '/dicas')
        // return ...;

        return MaterialPageRoute(
          builder: (ctx) => const CategoriesScreen(),
        );
      },
      //TIP: É executado quandpo nenhuma rota é encontra
      // (tanto no routes quanto no onGenerateRoute)
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => const CategoriesScreen(),
        );
      },
    );
  }
}
