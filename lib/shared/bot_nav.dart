import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../services.dart';

class BotNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var service = Provider.of<Services>(context);
    return BottomNavigationBar(
      showUnselectedLabels: true,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.orange,
      elevation: 3,
      selectedIconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      unselectedIconTheme: IconThemeData(color: Colors.white),
      currentIndex: service.getIndex,
      onTap: (number) {
        service.setIndex = number;
        switch (number) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, '/topics');
            break;
          case 2:
            Navigator.pushNamed(context, '/dumbest');
            break;
          default:
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.poop,
          ),
          title: Text(
            'Search',
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.trash,
          ),
          title: Text(
            'Topics',
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.toiletPaper,
          ),
          title: Text(
            'Dumbest Ever',
          ),
        ),
      ],
      backgroundColor: Colors.black87,
    );
  }
}
