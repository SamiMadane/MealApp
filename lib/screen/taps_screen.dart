import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screen/category_screen.dart';
import 'package:meal_app/screen/favorite_screen.dart';

import '../models/meal.dart';
import '../widget/main_drawer.dart';

class TapsScreeen extends StatefulWidget {
  final List<Meal> favoriteMeal;

  TapsScreeen( this.favoriteMeal);

  @override
  State<TapsScreeen> createState() => _TapsScreeenState();
}

class _TapsScreeenState extends State<TapsScreeen> {

  int currentIndex = 0;
  void _selectItem(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  late List<Map<String, Object>> _pages ;
  @override
  void initState() {
    _pages = [
      {
        'page':CategoryScreen(),
        'title':'Categories'
      },
      {
        'page':FavoriteScreen(widget.favoriteMeal),
        'title':'Favorites'
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[currentIndex]['title'].toString()),
      ),
      body: _pages[currentIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectItem,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorites'),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: currentIndex,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
      ),
      drawer: MainDrawer(),
    );
  }

}
