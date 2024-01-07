import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/main_drawer.dart';

class MyThemedScreen extends StatefulWidget {
  static const routeName = '/themes';

  @override
  _MyThemedScreenState createState() => _MyThemedScreenState();
}

class _MyThemedScreenState extends State<MyThemedScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ThemeProvider>(context, listen: false).getThemeColors();
    Provider.of<ThemeProvider>(context, listen: false).getThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Themed Screen',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          drawer: MainDrawer(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Adjust your theme.',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    _buildButton(context, 'Light', ThemeMode.light),
                    _buildButton(context, 'Dark', ThemeMode.dark),
                    _buildButton(context, 'System', ThemeMode.system),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildButton(BuildContext context, String title, ThemeMode themeMode) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          themeProvider.themeModeChange(themeMode);
        },
        child: Text(title),
      ),
    );
  }
}