import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../Providers/meal_provider.dart';
import '../Providers/theme_provider.dart';
import 'Screens/category_meal_screen.dart';
import 'Screens/filters_screen.dart';
import 'Screens/meal_detail_screen.dart';
import 'Screens/tabs_screen.dart';
import 'Screens/theme_screen.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MealProvider>(
          create: (ctx) => MealProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (ctx) => ThemeProvider(),
        ),

      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var primaryColor = Provider.of<ThemeProvider>(context, listen: true).primaryColor;
    var hintColor = Provider.of<ThemeProvider>(context, listen: true).hintColor;
    var tm = Provider.of<ThemeProvider>(context, listen: true).tm;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: tm,
      theme: ThemeData(
        primarySwatch: primaryColor,
        hintColor: hintColor,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        cardColor: Colors.white,
        shadowColor: Colors.black,
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1),
          ),
          titleLarge: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch:primaryColor ,
        hintColor: hintColor,
        canvasColor: Color.fromRGBO(14, 22, 33, 1),
        shadowColor: Colors.white60,
        textTheme: ThemeData.dark().textTheme.copyWith(
          bodyLarge: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(),
        MyThemedScreen.routeName: (context) => MyThemedScreen(),
      },
    );
  }
}