import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.screenName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.screenName: (ctx) => MealDetailScreen(),
        FiltersScreen.screenName: (ctx) => FiltersScreen(),
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
