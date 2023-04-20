import 'package:flutter/material.dart';
import 'package:flutter_grocery_app_ui/screens/favourte_page_screen.dart';
import 'package:flutter_grocery_app_ui/screens/notification_page_screen.dart';
import 'package:flutter_grocery_app_ui/widgets/drawer_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_grocery_app_ui/screens/groceries_page.dart';
import '../utils/constants.dart';
import 'profile_page_screen.dart';

class TabPageScreen extends StatefulWidget {
  const TabPageScreen({Key key}) : super(key: key);

  @override
  State<TabPageScreen> createState() => _TabPageScreenState();
}

class _TabPageScreenState extends State<TabPageScreen> {
  int selectedOptionIndex = 0;

  final _pageNavigation = [
    GroceriesPageScreen(),
    FavouritePageScreen(),
    NotificationPageScreen(),
    ProfilePage(),
  ];

  Widget _buildBody(index) {
    return _pageNavigation.elementAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(selectedOptionIndex),
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Color(0xff84CC83),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Row(
          children: List.generate(bottomNavigationBarOptions.length, (index) {
            if (index == selectedOptionIndex) {
              return Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedOptionIndex = index;
                    });
                  },
                  child: Center(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            bottomNavigationBarIcons[index],
                            color: Colors.green,
                          ),
                          Text(
                            bottomNavigationBarOptions[index],
                            style: GoogleFonts.varelaRound(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }

            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOptionIndex = index;
                  });
                },
                child: Icon(
                  bottomNavigationBarIcons[index],
                  color: Colors.white,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
