import 'package:flutter/material.dart';
import 'package:musico/widgets/bottom_nav_bar.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = "cartScreen";
  CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Container(
        child: Container(
          child: Text("Cart"),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedItem: 2,
      ),
    );
  }
}
