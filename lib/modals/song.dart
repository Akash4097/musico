import 'package:flutter/material.dart';

class Song {
  final String albumName;
  final double ratings;
  final double price;
  final String gener;

  Song(
      {@required this.albumName,
      @required this.ratings,
      @required this.price,
      this.gener});
}
