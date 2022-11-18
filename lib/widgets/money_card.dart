import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nusacation/shared/shared.dart';

class MoneyCard extends StatelessWidget {
  final double width;
  final bool isSelected;
  final int amount;
  final Function? onTap;

  const MoneyCard(
      {super.key,
      this.isSelected = false,
      this.amount = 0,
      this.onTap,
      this.width = 90});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
                color: isSelected ? Colors.transparent : Color(0xFFE4E4E4)),
            color: isSelected ? kBlueColor : Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("IDR",
                style: isSelected
                    ? whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400)
                    : grey3TextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400)),
            SizedBox(
              height: 6,
            ),
            Text(
                NumberFormat.currency(
                        locale: 'id_ID', decimalDigits: 0, symbol: '')
                    .format(amount),
                style: isSelected
                    ? whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400)
                    : blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400))
          ],
        ),
      ),
    );
  }
}
