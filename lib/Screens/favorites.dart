import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/meal_provider.dart';
import '../modules/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState()=> _FavoritesScreenState();

}
class  _FavoritesScreenState extends State<FavoritesScreen>{
  @override
  void initState()
  {
    Provider.of<MealProvider>(context, listen: false).getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final List<Meal> favoriteMeals = Provider.of<MealProvider>(context, listen: true).favoriteMeals;
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("You have no favorites yet - start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            imageUrl: favoriteMeals[index].imageUrl,
            title: favoriteMeals[index].title,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
            removeItem: _removeItem,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }

  _removeItem() {
  }
}