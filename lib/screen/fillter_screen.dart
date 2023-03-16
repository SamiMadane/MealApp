import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/widget/main_drawer.dart';

class FillterScreen extends StatefulWidget {
  static const routeName = 'fillterScreen';

  final Function saveFilters;
  final Map<String,bool> fillter;

  FillterScreen(this.fillter,this.saveFilters);

  @override
  State<FillterScreen> createState() => _FillterScreenState();
}

class _FillterScreenState extends State<FillterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
     _glutenFree = widget.fillter['gluten']!;
     _lactoseFree = widget.fillter['lactose']!;
     _vegan = widget.fillter['vegan']!;
     _vegetarian = widget.fillter['vegetarian']!;
    super.initState();
  }

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, ValueChanged<bool> updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: (Text(description)),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Fillter'),
        actions: [
          IconButton(
              onPressed: (){
                Map<String,bool> selectedFillter = {
                  'gluten' : _glutenFree,
                  'lactose' : _lactoseFree,
                  'vegan' : _vegan,
                  'vegetarian' : _vegetarian,
                };
                widget.saveFilters(selectedFillter);
              },
            icon: Icon(Icons.save)),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  'Gluten-free', 'Only include gluten free meals.', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              buildSwitchListTile('Lactose-free',
                  'Only include lactose free meals.', _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              buildSwitchListTile(
                  'Vegetarian', 'Only include vegetarian meals.', _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              buildSwitchListTile('Vegan', 'Only include vegan meals.', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
