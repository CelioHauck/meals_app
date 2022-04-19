import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

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
