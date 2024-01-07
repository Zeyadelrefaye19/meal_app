import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegetarian;
  final bool isVegan;
  final bool isLactoseFree;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isVegetarian,
    required this.isVegan,
    required this.isLactoseFree,
  });

}

Meal c1 = Meal(
  id: 'c1',
  categories: ['Italian', 'Pasta'],
  title: 'Spaghetti with Tomato Sauce',
  imageUrl: 'https://www.example.com/images/spaghetti.jpg',
  ingredients: ['Spaghetti', 'Tomatoes', 'Olive oil', 'Garlic'],
  steps: [
    'Boil water in a large pot',
    'Add spaghetti and cook for 8 to 10 minutes',
    'Heat olive oil in a pan and add garlic',
    'Add chopped tomatoes and cook for 5 minutes',
    'Serve spaghetti with tomato sauce on top',
  ],
  duration: 20,
  complexity: Complexity.Simple,
  affordability: Affordability.Affordable,
  isGlutenFree: false,
  isLactoseFree: true,
  isVegan: true,
  isVegetarian: true,
);
