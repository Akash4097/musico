import 'package:flutter/material.dart';

class Song {
  final int trackId;
  final String songName;
  final String artistName;
  final double price;
  int quantity;
  final String genre;
  final String imageUrl;
  Song(
      {@required this.trackId,
      @required this.imageUrl,
      @required this.songName,
      this.artistName,
      @required this.price,
      this.genre});
}
