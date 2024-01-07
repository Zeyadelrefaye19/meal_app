import 'package:flutter/material.dart';
import 'package:meal_app/Providers/meal_provider.dart';
import '../Widgets/main_drawer.dart';

import './category_screen.dart';
import './favorites.dart';
import 'package:provider/provider.dart';


class TabsScreen extends StatefulWidget {



  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late final List<Map<String, Object>> _pages;
  int _selectedPageIndex =0;
  @override
  void initState() {
    Provider.of<MealProvider>(context,listen:false).getData();
   _pages=  [
     {
       'page': CategoriesScreen(),
       'title': 'Categories',
     },
     {
       'page': FavoritesScreen(),
       'title': 'Favorites',
     },
   ];
    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).hintColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}