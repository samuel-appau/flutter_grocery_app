import 'package:flutter/material.dart';
import 'package:flutter_grocery_app_ui/screens/tab_page_screen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Groceries App',
      debugShowCheckedModeBanner: false,
      home: TabPageScreen(),
    );
  }
}
