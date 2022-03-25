import 'package:flutter/material.dart';

import './models/meal.dart';
import './dummy_data.dart';
import 'screens/filters_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/single_category_screen.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) return false;
        if (_filters['lactose'] && !meal.isLactoseFree) return false;
        if (_filters['vegan'] && !meal.isVegan) return false;
        if (_filters['vegetarian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingindex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingindex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingindex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favouriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme(
          primary: Colors.pink,
          primaryVariant: Colors.pinkAccent,
          secondary: Colors.amber,
          secondaryVariant: Colors.amberAccent,
          background: Colors.white,
          error: Colors.red,
          surface: Colors.red,
          brightness: Brightness.light,
          onBackground: Colors.red,
          onError: Colors.red,
          onPrimary: Colors.red,
          onSecondary: Colors.red,
          onSurface: Colors.red,
        ),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        '/': (ctx) => TabsScreen(_favouriteMeals),
        '/category-meals': (ctx) => SingleCategoryScreen(_availableMeals),
        '/meal-details': (ctx) =>
            MealDetailsScreen(_toggleFavorite, _isMealFavorite),
        '/filters': (ctx) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
