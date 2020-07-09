import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musico/providers/song_provider.dart';
import 'package:musico/widgets/add_to_cart_widget.dart';
import 'package:musico/widgets/bottom_nav_bar.dart';
import 'package:musico/widgets/custom_card.dart';
import 'package:musico/widgets/custom_item_builder.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _initState = true;
  var _isLoading = false;

  Future<void> getData() async {
    await Provider.of<SongProvider>(context).fetchSongsData();
  }

  @override
  void didChangeDependencies() {
    if (_initState) {
      setState(() {
        _isLoading = true;
        getData().then((value) => _isLoading = false);
      });
      _initState = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _data = Provider.of<SongProvider>(context).song;

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
          body: _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  child: CustomItemsBuilder(
                    totalItems: _data.length,
                    childAspectRaito: 3 / 4.2,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomCard(
                        margin: const EdgeInsets.only(bottom: 8.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              height: 140,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.network(
                                  _data[index].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              margin:
                                  const EdgeInsets.only(bottom: 4.0, top: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    _data[index].songName,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(_data[index].artistName),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "\$${_data[index].price}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      _buildCustomIconButton(
                                          artistName: _data[index].artistName,
                                          songName: _data[index].songName,
                                          price: _data[index].price),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
          bottomNavigationBar: BottomNavBar(
            selectedItem: 0,
          )),
    );
  }

  Widget _buildCustomIconButton(
      {double price, String songName, String artistName}) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext ctx) => AddToCart(
                  artistName: artistName,
                  songName: songName,
                  price: price,
                ));
      },
      child: Container(
        alignment: Alignment.center,
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: Colors.yellow[700],
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Icon(
          Icons.add,
          size: 18.0,
        ),
      ),
    );
  }
}
