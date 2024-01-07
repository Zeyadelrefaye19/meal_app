import 'package:flutter/material.dart';
import 'package:meal_app/Screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem({  required this.id,  required this.title,  required this.color});

  void selectCategory (BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id':id,
        'title':title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding:EdgeInsets.all(15),
        child: Text(title,),
        decoration: BoxDecoration(
         gradient: LinearGradient(
           colors: [
             color.withOpacity(0.1),
             color,
           ],
           begin: Alignment.topLeft,
           end: Alignment.bottomRight,
         ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
