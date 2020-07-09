import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musico/widgets/custom_card.dart';
import 'package:musico/widgets/custom_item_builder.dart';

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
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.filter),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(8.0),
          child: CustomItemsBuilder(
            totalItems: 2,
            childAspectRaito: 3 / 3.5,
            itemBuilder: (BuildContext context, int index) {
              return CustomCard(
                margin: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Image.network(
                        "",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text("Song Name"),
                    Text("Rating(optional)"),
                    Row(
                      children: <Widget>[
                        Text("price"),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
