import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  MealItem(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.affordability,
      @required this.complexity,
      @required this.duration,
      @required this.removeItem});

  String get complxityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;

      case Complexity.Hard:
        return 'Hard';
        break;

      case Complexity.Challenging:
        return 'Challenging';
        break;

      default:
        return 'Unknown';
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;

      case Affordability.Luxurious:
        return 'Luxurious';
        break;

      case Affordability.Pricey:
        return 'Pricey';
        break;

      default:
        return 'Unknown';
        break;
    }
  }

// future is used when a task is done then future (then operation) funtioonaly is called
  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
          MealDetailScreen.screenName,
          arguments: id,
        )
        .then((result) => {
              if (result != null)
                {
                  removeItem(result),
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: Container(
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  bottom: 20,
                  right: 0,
                  left: 0,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  buildRowItemMeal(
                    '${duration} min',
                    Icon(Icons.schedule),
                  ),
                  buildRowItemMeal(
                    complxityText,
                    Icon(Icons.work),
                  ),
                  buildRowItemMeal(
                    affordabilityText,
                    Icon(Icons.attach_money),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildRowItemMeal(String title, Icon icon) {
    return Row(
      children: <Widget>[
        icon,
        SizedBox(
          width: 6,
        ),
        Text(
          title,
          style: TextStyle(
              color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
