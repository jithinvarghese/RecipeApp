import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        accentColor: Colors.amber,
        canvasColor: Colors.blueGrey,
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
      home: CategoriesScreen(),
      routes: {
        CategoryMealsScreen.screenName: (ctx) => CategoryMealsScreen(),
      },
    );
  }
}
