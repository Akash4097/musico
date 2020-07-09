import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:musico/modals/song.dart';

class SongProvider with ChangeNotifier {
  List<Song> _songs = [];
  List<Song> _orderedSongs = [];

  List<Song> get song {
    return [..._songs];
  }

  List<Song> get orderedSong {
    return [..._orderedSongs];
  }

  Future<void> fetchSongsData() async {
    var url = "https://itunes.apple.com/search?term=music";

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body)["results"];
      final List<Song> loadedSongs = [];

      extractedData.forEach((data) {
        loadedSongs.add(
          Song(
              imageUrl: data["artworkUrl100"],
              songName: data["trackName"],
              price: data["trackPrice"],
              genre: data["primaryGenreName"],
              artistName: data["artistName"],
              trackId: data["trackId"]),
        );
      });
      print(loadedSongs.first.imageUrl);
      _songs = loadedSongs;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  setOrderSong(int trackId) {
    List<Song> _songList = [..._orderedSongs];

    final Song song = [..._songs].firstWhere((song) => song.trackId == trackId);

    if (_songList.contains(song)) {
      print("found");
      song.quantity += 1;
    } else {
      print("not found");
      song.quantity = 1;
    }

    _songList.add(song);
    _orderedSongs = _songList;
    notifyListeners();
  }

  List<Song> getOrderSong() {
    return _orderedSongs;
  }

  double totalPrice() {
    var sum = 0.0;
    _orderedSongs.forEach((song) {
      sum += song.price * song.quantity;
    });

    return sum;
  }
}
