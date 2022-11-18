import 'package:flutter/material.dart';

class PopularSpot extends StatelessWidget {
  final String imageUrl;

  PopularSpot({
    this.imageUrl = "",
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: 110,
      margin: EdgeInsets.only(
        right: 24,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imageUrl),
        ),
      ),
    );
  }
}
