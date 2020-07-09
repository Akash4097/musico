import 'package:flutter/material.dart';
import 'package:musico/widgets/bottom_nav_bar.dart';

class UserAccountScreen extends StatelessWidget {
  static const String routeName = "userAccountScreen";
  const UserAccountScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Account"),
      ),
      body: Container(
        child: Center(
          child: Text("Work in progress...."),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedItem: 1,
      ),
    );
  }
}
