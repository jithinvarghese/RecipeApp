import 'package:RecipeApp/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenName = '/filter_screen';
  final Function saveFilter;
  final Map<String, bool> currentFilter;
  FiltersScreen(this.currentFilter, this.saveFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  @override
  initState() {
    _isGlutenFree = widget.currentFilter['isGlutenFree'];
    _isVegan = widget.currentFilter['isVegan'];
    _isVegetarian = widget.currentFilter['isVegetarian'];
    _isLactoseFree = widget.currentFilter['isLactoseFree'];

    super.initState();
  }

  Widget _buildSwitch(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilter = {
                'isGlutenFree': _isGlutenFree,
                'isVegan': _isVegan,
                'isVegetarian': _isVegetarian,
                'isLactoseFree': _isLactoseFree,
              };
              widget.saveFilter(selectedFilter);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitch(
                  'Gluten-Free',
                  'Only include gluten-free meals',
                  _isGlutenFree,
                  (newvalue) {
                    setState(() {
                      _isGlutenFree = newvalue;
                    });
                  },
                ),
                _buildSwitch(
                  'vegan-Free',
                  'Only include vegan-free meals',
                  _isVegan,
                  (newvalue) {
                    setState(() {
                      _isVegan = newvalue;
                    });
                  },
                ),
                _buildSwitch(
                  'Vegetarian-Free',
                  'Only include Vegetarian-free meals',
                  _isVegetarian,
                  (newvalue) {
                    setState(() {
                      _isVegetarian = newvalue;
                    });
                  },
                ),
                _buildSwitch(
                  'Lactose-Free',
                  'Only include Lactose-free meals',
                  _isLactoseFree,
                  (newvalue) {
                    setState(() {
                      _isLactoseFree = newvalue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
