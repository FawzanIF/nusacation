import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nusacation/bloc/blocs.dart';
import 'package:nusacation/models/destination_model.dart';
import 'package:nusacation/shared/shared.dart';

class DestinationCard extends StatelessWidget {
  final DestinationModel? destination;
  final Function()? onTap;

  const DestinationCard(this.destination, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

        // context.read<PageBloc>().add(GoToDetailDestinationPage(destination!));

      child: Container(
                    margin: EdgeInsets.only(bottom: 16),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 174,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(destination!.imageUrl!))),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                               destination!.city!,
                              style: greyTextStyle.copyWith(
                                fontWeight: light,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              destination!.name!,
                              style: blackTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                                 NumberFormat.currency(
                                    locale: "id_ID",
                                    decimalDigits: 0,
                                    symbol: "Rp. ")
                                .format(destination!.price!),
                              style: blueTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        context.watch<FavoritBloc>().isWishlist(destination!)
                            ? 'assets/ic-love-act.png'
                            : 'assets/ic-love-inact.png',
                        height: 40,
                        width: 40,
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: kYellowColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(children: [
                      Text(
                        '50%',
                        style: redTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'OFF',
                        style: whiteTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 12,
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    width: 58,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/ic-star.png',
                              ),
                            ),
                          ),
                        ),
                        Text(
                          destination!.rating!.toString(),
                          style: blackTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
