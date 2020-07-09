import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:musico/modals/song.dart';

class SongProvider with ChangeNotifier {
  List<Song> _songs = [];

  List<Song> get song {
    return [..._songs];
  }

  Future<void> fetchSongsData() async {
    var url = "https://itunes.apple.com/search?term=music";

    try {
      print("started");
      final response = await http.get(url);
      final extractedData = json.decode(response.body)["results"];
      print(extractedData);
      final List<Song> loadedSongs = [];

      extractedData.forEach((data) {
        loadedSongs.add(
          Song(
              imageUrl: data["artworkUrl100"],
              albumName: data["trackName"],
              price: data["trackPrice"],
              genre: data["primaryGenreName"]),
        );
      });
      print(loadedSongs.first.imageUrl);
      _songs = loadedSongs;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
