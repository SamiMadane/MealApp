import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screen/meal_details.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  String get complexityText{
    switch(complexity){
      case Complexity.Simple : return 'Simple'; break;
      case Complexity.Challenging : return 'Challenging'; break;
      case Complexity.Hard : return 'Hard'; break;
      default : return 'Unknow'; break;
    }
  }
  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable : return 'Affordable'; break;
      case Affordability.Luxurious : return 'Luxurious'; break;
      case Affordability.Pricey : return 'Pricey'; break;
      default : return 'Unknow'; break;
    }
  }
  void selectMeal(BuildContext context){
    Navigator.of(context).pushNamed(MealDetails.routeName,arguments: id)
        .then((value)
    {
      // if (value != null) removeItem(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image(
                    image: NetworkImage(imageUrl),
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(15),topRight:Radius.circular(15)),
                ),
                Positioned(
                  bottom: 20,
                    right: 10,
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                        color: Colors.black54,
                        width: 300,
                        child:
                        Text(
                          title,
                          style: TextStyle(color: Colors.white,fontSize: 24),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ))),
              ],
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 3,),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 3,),
                      Text('$complexityText'),
                    ],

                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money_outlined),
                      SizedBox(width: 3,),
                      Text('$affordabilityText'),
                    ],

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
