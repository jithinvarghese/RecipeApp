import 'package:RecipeApp/widgets/meal_item.dart';
import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

import './dummy_data.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactoseFree': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favriteMeals = [];

  void _setFliter(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filter['isGlutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filter['isVegan'] && !meal.isVegan) {
          return false;
        }
        if (_filter['isVegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filter['isLactoseFree'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        primaryColor: Colors.purple,
        accentColor: Colors.amber,
        canvasColor: Colors.blueGrey[100],
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: ThemeData().textTheme.headline6.copyWith(
                  color: Colors.white,
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
            bodyText1: TextStyle(
              color: Colors.black,
            ),
            bodyText2: TextStyle(
              color: Colors.yellow,
            )),
      ),
      routes: {
        '/': (ctx) => TabsScreen(_favriteMeals),
        CategoryMealsScreen.screenName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.screenName: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.screenName: (ctx) => FiltersScreen(_filter, _setFliter),
      },
      // for safety if navgation looking for unknow name
      // onGenerateInitialRoutes is called when non registed route name or pushNamed route is called
      onGenerateRoute: (settings) {
        print(settings.arguments);
        print(settings.name);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      // onUnknownRoute is called when Flutter fails to load all the other measuers
      //  we can it can be last resout to show somthing on the screens
      // or say when page doent exist to show a dummy page we can use this
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
