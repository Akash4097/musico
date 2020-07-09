import 'package:flutter/material.dart';
import 'package:musico/widgets/custom_card.dart';
import 'package:musico/widgets/custom_item_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Music"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.filter),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(8.0),
          child: CustomItemsBuilder(
            totalItems: 2,
            childAspectRaito: 3 / 2.2,
            itemBuilder: (BuildContext context, int index) {
              return CustomCard(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                child: Text("one"),
              );
            },
          ),
        ),
      ),
    );
  }
}
