import 'package:flutter/material.dart';

class CustomItemsBuilder extends StatelessWidget {
  final int totalItems;
  final Function(BuildContext context, int index) itemBuilder;
  final double childAspectRaito;
  final int crossAxisCount;
  CustomItemsBuilder(
      {Key key,
      @required this.totalItems,
      @required this.itemBuilder,
      this.crossAxisCount,
      this.childAspectRaito})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        padding: EdgeInsets.only(top: 16.0),
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: childAspectRaito ?? 3 / 2,
            crossAxisSpacing: 24.0,
            crossAxisCount: crossAxisCount ?? 2),
        shrinkWrap: true,
        itemCount: totalItems,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
