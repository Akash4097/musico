import 'package:flutter/material.dart';

class Song {
  final String albumName;
  final double ratings;
  final double price;
  final String genre;
  final String imageUrl;
  Song(
      {@required this.imageUrl,
      @required this.albumName,
       this.ratings,
      @required this.price,
      this.genre});
}
