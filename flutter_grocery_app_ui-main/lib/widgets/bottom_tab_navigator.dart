import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomTabNavigator extends StatefulWidget {
  get selectedOptionIndex => null;

  @override
  _BottomTabNavigatorState createState() => _BottomTabNavigatorState();
}

class _BottomTabNavigatorState extends State<BottomTabNavigator> {
  int selectedOptionIndex = 0;
  

  
  @override
  Widget build(BuildContext context) {
    List<String> bottomNavigationBarOptions = [
      'Home',
      'Favorites',
      'Notifications',
      'Profile'
    ];


    List<IconData> bottomNavigationBarIcons = [
      Icons.home,
      Icons.favorite_border,
      Icons.notifications_none,
      Icons.person_outline
    ];


    return Container(
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
    );
  }
}
