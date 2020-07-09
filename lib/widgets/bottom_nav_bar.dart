import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musico/screens/cart_screen.dart';
import 'package:musico/screens/home_screen.dart';
import 'package:musico/screens/user_account_screen.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedItem;
  BottomNavBar({Key key, @required this.selectedItem}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        currentIndex: widget.selectedItem,
        selectedItemColor: Colors.yellow[600],
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.music),
            title: Text('Music'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            title: Text("Account"),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.shoppingCart),
            title: Text('Cart'),
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(selectedItem) {
    setState(() {
      switch (selectedItem) {
        case 0:
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          break;
        case 1:
          Navigator.of(context)
              .pushReplacementNamed(UserAccountScreen.routeName);
          break;
        case 2:
          Navigator.of(context).pushNamed(CartScreen.routeName);
          break;
      }
    });
  }
}
