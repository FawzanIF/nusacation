import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nusacation/shared/shared.dart';

class RowDetails extends StatelessWidget {
  // const RowDetails({ Key? key }) : super(key: key);
  final String det1;
  final String det2;
  final Color clr;
  final FontWeight weight;

  RowDetails({required this.det1, required this.det2, required this.clr, required this.weight});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.check_circle_outline, color: Colors.blue,),
                SizedBox(width: 5,),
                Text(
                  det1,
                  style: blackTextStyle,
                ),
              ],
            ),
            Text(
              det2,
              style: GoogleFonts.poppins(color: clr, fontWeight: weight),
            )
          ],
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
