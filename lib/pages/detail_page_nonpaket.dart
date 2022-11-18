part of 'pages.dart';

class DetailDestinationPage extends StatelessWidget {
  final DestinationModel? destination;

  DetailDestinationPage(this.destination);

  @override
  Widget build(BuildContext context) {
    bool isWishlist = context.watch<FavoritBloc>().isWishlist(destination!);
    List<Widget> star = List.generate(
        5,
        (index) => Container(
              margin: EdgeInsets.only(right: 4),
              child: Image.asset(
                'assets/ic-star.png',
                height: 24,
                width: 24,
              ),
            ));

    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToMainPage());

        return false;
      },
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          bottom: true,
          child: Stack(
            children: [
              ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 350,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(destination!.imageUrl!),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 320),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(28),
                          ),
                          color: kBackgroundColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: defaultMargin,
                                right: defaultMargin,
                                top: 30,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          destination!.name!,
                                          style: blackTextStyle.copyWith(
                                            fontSize: 20,
                                            fontWeight: medium,
                                          ),
                                          maxLines: 1,

                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          destination!.city!,
                                          style: grey3TextStyle.copyWith(
                                            fontSize: 18,
                                            fontWeight: light,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 28,
                                        width: 28,
                                        margin: EdgeInsets.only(
                                          right: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/ic-star.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 2,
                                        ),
                                        child: Text(
                                          destination!.rating.toString(),
                                          style: blackTextStyle.copyWith(
                                            fontWeight: medium,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                top: 18,
                                left: defaultMargin,
                                right: defaultMargin,
                              ),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: kGrey2Color,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Harga mulai dari',
                                    style: blackTextStyle.copyWith(fontSize: 14), 
                                    
                                  ),
                                  Text(
                                    '\Rp. ' + destination!.price.toString() +'/Orang',
                                    style: blueTextStyle.copyWith(
                                        fontSize: 15, fontWeight: semiBold),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: defaultMargin),
                              child: Text(
                                'Fasilitas',
                                style: blackTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: medium,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: defaultMargin,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  FacilityItem(
                                    name: 'Restaurant',
                                    height: 10,
                                    imageUrl: 'assets/icon_restaurant.png',
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  FacilityItem(
                                    name: 'Hotel',
                                    height: 3,
                                    imageUrl: 'assets/icon_hotel.png',
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  FacilityItem(
                                    name: 'Tempat Ibadah',
                                    height: 4,
                                    imageUrl: 'assets/icon_mosque.png',
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 18,
                                left: defaultMargin,
                                right: defaultMargin,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Spot Unggulan',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: medium,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        PopularSpot(
                                          imageUrl: 'assets/img-spot3.png',
                                        ),
                                        PopularSpot(
                                          imageUrl: 'assets/img-spot2.png',
                                        ),
                                        PopularSpot(
                                          imageUrl: 'assets/img-spot2.png',
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 18,
                                left: defaultMargin,
                                right: defaultMargin,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lokasi',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(children: [
                                    Expanded(
                                      child: Text(
                                        "Flores, Nusa Tenggara Timur",
                                        style: grey3TextStyle.copyWith(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 42,
                                        width: 42,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'assets/ic-location.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ])
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 18,
                                left: defaultMargin,
                                right: defaultMargin,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pemandu Wisata',
                                    style: blackTextStyle.copyWith(
                                        fontSize: 16, fontWeight: medium),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(children: [
                                    Image.asset(
                                      "assets/img-guide1.png",
                                      height: 50,
                                      width: 50,
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Rizky Setiawan",
                                          style: blackTextStyle.copyWith(
                                              fontSize: 14, fontWeight: medium),
                                        ),
                                        Text(
                                          "Flores, NTT",
                                          style: grey3TextStyle.copyWith(
                                              fontSize: 12, fontWeight: light),
                                        ),
                                      ],
                                    )
                                  ])
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 18,
                                left: defaultMargin,
                                right: defaultMargin,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kata Mereka',
                                    style: blackTextStyle.copyWith(
                                        fontSize: 16, fontWeight: medium),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "assets/img-user-pro.png",
                                          height: 54,
                                          width: 54,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Geral Darwin",
                                                  style: blueTextStyle.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: medium),
                                                ),
                                                Container(
                                                  height: 8,
                                                  width: 8,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 8),
                                                  decoration: BoxDecoration(
                                                      color: kGrey3Color,
                                                      shape: BoxShape.circle),
                                                ),
                                                Text(
                                                  "Pengunjung",
                                                  style:
                                                      grey3TextStyle.copyWith(
                                                          fontSize: 14,
                                                          fontWeight: medium),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              children: star,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                              child: Text(
                                                'Tempat ini punya banyak spot keren untuk momen foto kita, yuk kunjungi tempat ini',
                                                style: blackTextStyle.copyWith(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 18,
                                  left: defaultMargin,
                                  right: defaultMargin,
                                  bottom: 30),
                              alignment: Alignment.center,
                              child: TextButton(
                                onPressed: () {
                                   context.read<PageBloc>().add(
                                       GoToDestBookingPage(destination!));
                                },
                                style: TextButton.styleFrom(
                                  minimumSize: const Size.fromHeight(54),
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  backgroundColor: kBlueColor,
                                ),
                                child: Text(
                                  'Lanjut Pemesanan',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: semiBold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                  vertical: 18,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 8, top: 12, bottom: 12, right: 12),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xffE0E0E0)),
                      child: InkWell(
                        onTap: () {
                          context.read<PageBloc>().add(GoToMainPage());
                        },
                        child: Image.asset(
                          'assets/btn-back.png',
                          width: 28,
                          height: 28,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<FavoritBloc>().setProduct(destination!);
                        if (context
                            .read<FavoritBloc>()
                            .isWishlist(destination!)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(milliseconds: 700),
                              backgroundColor: kBlueColor,
                              content: Text(
                                'Berhasil Ditambah ke Favorit',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(milliseconds: 700),
                              backgroundColor: kRedColor,
                              content: Text(
                                'Berhasil Dihapus dari Favorit',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                      },
                      child: Image.asset(
                        context.watch<FavoritBloc>().isWishlist(destination!)
                            ? 'assets/ic-love-act.png'
                            : 'assets/ic-love-inact.png',
                        width: 46,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
