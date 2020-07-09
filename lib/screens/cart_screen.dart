import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musico/modals/song.dart';
import 'package:musico/providers/song_provider.dart';
import 'package:musico/widgets/bottom_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = "cartScreen";

  CartScreen({
    Key key,
  }) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _currentDate = DateTime.now().toLocal();
  @override
  Widget build(BuildContext context) {
    final List<Song> _orderedSong =
        Provider.of<SongProvider>(context, listen: false).getOrderSong();
    final double _totalPrice = Provider.of<SongProvider>(context).totalPrice();

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        child: _orderedSong.length == 0
            ? Center(
                child: Text("No Data!"),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${DateFormat("EEE").format(_currentDate)} ${_currentDate.day}th of ${DateFormat("MMMM").format(_currentDate)}",
                    style:
                        TextStyle(fontSize: 26.0, fontWeight: FontWeight.w700),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .55,
                    child: ListView(
                      shrinkWrap: true,
                      children: _orderedSong.map((song) {
                        return _buildListItem(
                            songName: song.songName,
                            artistName: song.artistName,
                            price: song.price,
                            quantity: song.quantity,
                            imgUrl: song.imageUrl);
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total:",
                        style: TextStyle(fontSize: 22.0),
                      ),
                      Text(
                        "\$ $_totalPrice",
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 16.0),
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
                ],
              ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedItem: 2,
      ),
    );
  }

  Widget _buildListItem(
      {String songName,
      String artistName,
      double price,
      String imgUrl,
      int quantity}) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleAvatar(
            maxRadius: 40.0,
            backgroundImage: NetworkImage(imgUrl),
          ),
          Container(
            width: 110,
            child: Column(
              children: <Widget>[
                Text(
                  songName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.minus,
                        size: 18.0,
                      ),
                      onPressed: () {},
                    ),
                    Text("1"),
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.plus,
                        size: 18.0,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "\$ $price",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(
                height: 16.0,
              ),
              _buildCustomIconButton(() {})
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCustomIconButton(Function onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: Colors.yellow[700],
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Icon(
          FontAwesomeIcons.times,
          size: 14.0,
        ),
      ),
    );
  }
}
