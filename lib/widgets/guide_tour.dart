import 'package:flutter/material.dart';
import 'package:nusacation/models/guide_tour_model.dart';
import 'package:nusacation/shared/shared.dart';
import 'package:url_launcher/url_launcher.dart';


class GuideTourCard extends StatelessWidget {
  final GuideTourModel? guide;

  const GuideTourCard(this.guide, {super.key});
  void customLaunch(command) async {
      await launch(command); 
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        customLaunch(guide!.walink!);

      },
      child: Container(
        margin: EdgeInsets.only(
          top: 6,
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    guide!.imageUrl!,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    guide!.name!,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Guide Tour',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: 20,
                  margin: EdgeInsets.only(
                    right: 2,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/ic-star.png',
                      ),
                    ),
                  ),
                ),
                Text(
                  guide!.rating.toString(),
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
