import 'package:flutter/material.dart';

import '../Screens/filters_screen.dart';
import 'package:provider/provider.dart';

import '../Providers/theme_provider.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(
      String title,
      IconData icon,
      VoidCallback tapHandler,
      BuildContext ctx,
      Color iconColor,
      Color textColor,
      ) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: iconColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor,  // Set the text color to textColor
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {

    Color iconColor = Colors.red;
    Color textColor = Colors.red;

    return Drawer(
      elevation: 0,
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).hintColor,
            child: Row(
              children: [
                Icon(
                  Icons.set_meal_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'Cooking Up!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            "Meal",
            Icons.restaurant,
                () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            context,
            iconColor,
            textColor,
          ),
          buildListTile(
            "Filters",
            Icons.settings,
                () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            },
            context,
            iconColor,
            textColor,
          ),
          ListTile(
            leading: Icon(
              Icons.brightness_6,
              color: Colors.red,
            ),
            title: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                    themeProvider.themeModeChange(ThemeMode.dark);
                  },
                  child: Text(
                    'Dark',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                    themeProvider.themeModeChange(ThemeMode.light);
                  },
                  child: Text(
                    'Light',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            onTap: () {
              final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
              final newThemeMode = themeProvider.tm == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
              themeProvider.themeModeChange(newThemeMode);
              Navigator.of(context).pop();
            },
          ),

        ],
      ),
    );
  }
}