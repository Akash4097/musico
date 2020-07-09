import 'package:flutter/material.dart';
import 'package:musico/providers/song_provider.dart';
import 'package:musico/screens/cart_screen.dart';
import 'package:musico/screens/home_screen.dart';
import 'package:musico/screens/user_account_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      builder: (BuildContext context, Widget child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeScreen(),
          routes: {
            HomeScreen.routeName: (ctx) => HomeScreen(),
            UserAccountScreen.routeName: (ctx) => UserAccountScreen(),
            CartScreen.routeName: (ctx) => CartScreen()
          },
        );
      },
      value: SongProvider(),
    );
  }
}
