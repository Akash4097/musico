import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  final double price;
  final String songName;
  const AddToCart({Key key, @required this.price, @required this.songName})
      : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
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
        padding:
            EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0, bottom: 32.0),
        height: 350.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Your Order",
              style: TextStyle(fontSize: 28.0),
            ),
            SizedBox(
              height: 16.0,
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        widget.songName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      "\$ ${widget.price}",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Total:",
                  style: TextStyle(fontSize: 22.0),
                ),
                Text(
                  "\$ ${widget.price}",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                )
              ],
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
  }
}
