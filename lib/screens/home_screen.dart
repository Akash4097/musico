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
                          onPressed: () {
                            _addToCartSheet();
                          },
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

  void _addToCartSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          color: Color(0xFF737373),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: .6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36.0),
                topRight: Radius.circular(36.0),
              ),
            ),
            padding: EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
            height: 320.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Your Order",
                  style: TextStyle(fontSize: 28.0),
                ),
                ListView(
                  shrinkWrap: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text("Total:"), Text("total price")],
                ),
                Container(
                  width: 240.0,
                  height: 55.0,
                  child: RaisedButton(
                    textColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    color: Colors.yellow[700],
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
