import 'package:flutter/material.dart';
import 'package:nusacation/shared/shared.dart';

class FacilityItem extends StatelessWidget {
  final String? name;
  final String? imageUrl;
  final double height;

  FacilityItem({this.imageUrl, this.name, this.height = 0.0});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Image.asset(
          imageUrl!,
          width: 40,
        ),
        SizedBox(
          height: height,
        ),
        Text.rich(
          TextSpan(
            text: '$name',
            style: blueTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
