import 'package:flutter/material.dart';

import '../Screens/meal_detail_screen.dart';
import '../modules/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final int duration;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;


   MealItem(

      { required this.id,
        required this.title,
      required this.duration,
      required this.imageUrl,
      required this.complexity,
      required this.affordability,
        required this.removeItem,
      });
  
  String get complexityText{
   switch(complexity){
     case Complexity.Simple: return 'Simple'; break;
     case Complexity.Challenging: return 'Challenging'; break;
     case Complexity.Hard: return 'Hard'; break;
     default: return 'Unknown'; break;

   }
  }
  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,
    arguments: id,
    )
        .then((result) {
      //if (result !=null) removeItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:  const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule, color: Theme.of(context).bottomAppBarColor,),
                    SizedBox(
                      width: 6,
                    ),
                    Text("$duration min"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work,color: Theme.of(context).bottomAppBarColor,),
                    SizedBox(
                      width: 6,
                    ),
                    Text("$complexityText"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money,color: Theme.of(context).bottomAppBarColor,),
                    Text("$affordabilityText"),
                  ],
                ),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
