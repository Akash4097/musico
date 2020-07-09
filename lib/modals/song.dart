import 'package:flutter/material.dart';

class Song {
  final String songName;
  final String artistName;
  final double price;
  final String genre;
  final String imageUrl;
  Song(
      {@required this.imageUrl,
      @required this.songName,
       this.artistName,
      @required this.price,
      this.genre});
}
