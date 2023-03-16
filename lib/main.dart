import 'package:meal_app/screen/category_meals_screen.dart';
import 'package:meal_app/screen/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screen/fillter_screen.dart';
import 'package:meal_app/screen/meal_details.dart';
import 'package:meal_app/screen/taps_screen.dart';

import 'dummy_data.dart';
import 'models/meal.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _fillter = {
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilter(Map<String,bool> _fillterData){
    setState(() {
      _fillter = _fillterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_fillter['gluten']! && !meal.isGlutenFree)
          return false;
        if(_fillter['lactose']! && !meal.isLactoseFree)
          return false;
        if(_fillter['vegan']! && !meal.isVegan)
          return false;
        if(_fillter['vegetarian']! && !meal.isVegetarian)
          return false;
        return true;
      }).toList();
    });
  }

  List<Meal> _favoriteMeal = [];
  void _toggelFavorite(String mealId){
    int existIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existIndex >= 0){
      setState(() {
        _favoriteMeal.removeAt(existIndex);

      });
    }
    else{
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }
  bool isFavorite(String mealId){
    return _favoriteMeal.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium: const TextStyle(
              fontSize: 20,
              fontFamily:'RobotoCondensed',
            fontWeight: FontWeight.bold,
          )
        ),
      ),
    //  home: const CategoryScreen(),
      routes: {
        '/':(context) => TapsScreeen(_favoriteMeal),
        CategoryMealsScreen.routeName:(context) => CategoryMealsScreen(_availableMeals),
        MealDetails.routeName:(context) => MealDetails(_toggelFavorite,isFavorite),
        FillterScreen.routeName:(context) => FillterScreen(_fillter,_setFilter),
      },
    );
  }
}
