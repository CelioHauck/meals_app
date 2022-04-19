import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_filters.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final MealFilters _currentFilters;
  final void Function(MealFilters filters) _saveFilters;

  const FiltersScreen({
    Key? key,
    required MealFilters currentFilters,
    required void Function(MealFilters filters) saveFilters,
  })  : _currentFilters = currentFilters,
        _saveFilters = saveFilters,
        super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _glutenFree = widget._currentFilters.glutten;
    _lactoseFree = widget._currentFilters.lactose;
    _vegan = widget._currentFilters.vegan;
    _vegetarian = widget._currentFilters.vegetarian;
  }

  Widget _buildSwitchListTitle({
    required String title,
    required String description,
    required bool currentValue,
    required Function(bool actualValue) updateValue,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () => widget._saveFilters(
              MealFilters(
                glutten: _glutenFree,
                lactose: _lactoseFree,
                vegan: _vegan,
                vegetarian: _vegetarian,
              ),
            ),
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal section',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTitle(
                  title: 'Glutten free',
                  description: 'Only include gluten-free meal',
                  currentValue: _glutenFree,
                  updateValue: (val) {
                    setState(() {
                      _glutenFree = val;
                    });
                  },
                ),
                _buildSwitchListTitle(
                  title: 'Vegetarian free',
                  description: 'Only include vegetarian-free meal',
                  currentValue: _vegetarian,
                  updateValue: (val) {
                    setState(() {
                      _vegetarian = val;
                    });
                  },
                ),
                _buildSwitchListTitle(
                  title: 'Vegan free',
                  description: 'Only include vegan-free meal',
                  currentValue: _vegan,
                  updateValue: (val) {
                    setState(() {
                      _vegan = val;
                    });
                  },
                ),
                _buildSwitchListTitle(
                  title: 'Lactose free',
                  description: 'Only include lactose-free meal',
                  currentValue: _lactoseFree,
                  updateValue: (val) {
                    setState(() {
                      _lactoseFree = val;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
