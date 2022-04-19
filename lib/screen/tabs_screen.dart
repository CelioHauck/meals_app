import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screen/categories_screen.dart';

import '../widgets/main_drawer.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favoriteMeals;
  const TabsScreen({
    Key? key,
    required List<Meal> favoriteMeals,
  })  : _favoriteMeals = favoriteMeals,
        super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [];

  int _selectedPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pages.addAll([
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoriteScreen(favoriteMeals: widget._favoriteMeals),
        'title': 'Your Favorite'
      },
    ]);
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // Widget _buildTabBarExample() => DefaultTabController(
  //       length: 2,
  //       child: Scaffold(
  //         appBar: AppBar(
  //           title: const Text('Meals'),
  //           bottom: const TabBar(
  //             tabs: [
  //               Tab(
  //                 icon: Icon(Icons.category),
  //                 text: 'Categories',
  //               ),
  //               Tab(
  //                 icon: Icon(Icons.star),
  //                 text: 'Favorite',
  //               ),
  //             ],
  //           ),
  //         ),
  //         body: const TabBarView(children: [
  //           CategoriesScreen(),
  //           FavoriteScreen(),
  //         ]),
  //       ),
  //     );

  Widget _buildBottomTabBarExample(BuildContext ctx) => Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title'] as String),
        ),
        drawer: const MainDrawer(),
        body: _pages[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedPageIndex,
          // type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.star),
              label: 'Favorite',
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return _buildBottomTabBarExample(context);
  }
}
