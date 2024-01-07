 import 'package:flutter/material.dart';
 import 'package:shared_preferences/shared_preferences.dart';
import '../dummy_data.dart';
import '../modules/meal.dart';

class MealProvider with ChangeNotifier{
  Map<String,bool> filters ={
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];
  List<String> prefsMealId =[];

  void setFilters()async{

    availableMeals = DUMMY_MEALS.where((meal){
      if (filters['gluten']! && !meal.isGlutenFree){
        return false;
      }
      if (filters['lactose']! && !meal.isLactoseFree){
        return false;
      }
      if (filters['vegan']! && !meal.isVegan){
        return false;
      }
      if (filters['vegetarian']! && !meal.isVegetarian){
        return false;
      }
      return true;

    }).toList();
    notifyListeners();



    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("gluten",filters['gluten']!);
    prefs.setBool("lactose",filters['lactose']!);
    prefs.setBool("vegetarian",filters['vegetarian']!);
    prefs.setBool("vegan",filters['vegan']!);


  }

  void getData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    filters['gluten']=prefs.getBool("gluten")?? false;
    filters['lactose']= prefs.getBool("lactose")?? false;
    filters['vegetarian']=prefs.getBool("vegetarian")?? false;
    filters['vegan']=prefs.getBool("vegan")?? false;

     prefsMealId = prefs.getStringList("prefsMealId")!;
    for(var mealId in prefsMealId!){


      final existingIndex = favoriteMeals.indexWhere((meal) => meal.id== mealId);
      if (existingIndex<0) {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id== mealId));
      }

    }
    notifyListeners();
  }


  void toggleFavorites(String mealId)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id== mealId);
    if(existingIndex>=0){
      favoriteMeals.removeAt(existingIndex);
      prefsMealId.remove(mealId);


    }
    else{
      favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id== mealId));
      prefsMealId.add(mealId);
    }

    notifyListeners();

    prefs.setStringList("prefsMealId", prefsMealId);
  }

  bool isFavorite(String mealId){
 return  favoriteMeals.any((meal) => meal.id== mealId);
  }



}