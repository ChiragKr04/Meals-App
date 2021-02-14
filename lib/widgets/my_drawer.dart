import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MyDrawer extends StatelessWidget {
  Widget buildDrawerItems(
      String title, IconData icon, BuildContext context, Function handler) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ListTile(
        onTap: () {
          handler();
        },
        leading: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 10,
                  color: Colors.black54,
                ),
              ],
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    "https://www.thisislocallondon.co.uk/resources/images/12088462.jpg?display=1&htype=0&type=responsive-gallery",
                  ),
                ),
                Positioned(
                  bottom: 25,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          "Meals App",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 39,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          buildDrawerItems(
            "Meals",
            Icons.restaurant,
            context,
            () {
              Navigator.of(context).pushNamed("/");
            },
          ),
          buildDrawerItems(
            "Settings",
            Icons.settings,
            context,
            () {
              Navigator.of(context).pushNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
