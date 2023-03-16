import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen/fillter_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile (String title,IconData icon,Function() tapHandler){
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: (Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      )),
      onTap: tapHandler,
    );

  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            color: Theme.of(context).colorScheme.secondary,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meal', Icons.restaurant, (){Navigator.of(context).pushNamed('/');}),
          buildListTile('Fillters', Icons.settings, (){Navigator.of(context).pushNamed(FillterScreen.routeName);}),
        ],
      ),
    );
  }
}
