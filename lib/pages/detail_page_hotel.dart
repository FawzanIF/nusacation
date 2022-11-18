part of 'pages.dart';

class DetailHotelPage extends StatelessWidget {
  final DestinationModel? destination;

  DetailHotelPage(this.destination);

  @override
  Widget build(BuildContext context) {
    DestinationModel? dokterData;
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 260,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(destination!.imageUrl!),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: defaultMargin,
                            right: defaultMargin,
                            top: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      destination!.name!,
                                      style: blackTextStyle.copyWith(
                                        fontSize: 18,
                                        fontWeight: medium,
                                      ),
                                      maxLines: 1,

                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 42,
                                      width: 42,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/ic-location.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      destination!.location!,
                                      style: grey3TextStyle.copyWith(
                                        fontSize: 12,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 2),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "(2.4333)",
                                    style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                NumberFormat.currency(
                                        locale: "id_ID",
                                        decimalDigits: 0,
                                        symbol: "Rp. ")
                                    .format(destination!.price!) + '/Hari',
                                style: grey3TextStyle.copyWith(
                                  fontSize: 16,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 3,
                          width: double.infinity,
                          margin:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          decoration: BoxDecoration(
                              color: Color(0xffE7E7E7),
                              borderRadius: BorderRadius.circular(40)),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: defaultMargin, right: defaultMargin),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Deskripsi',
                                style: blackTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: medium,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                destination!.deskripsi!,
                                style: grey3TextStyle.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 3,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                              horizontal: defaultMargin, vertical: 16),
                          decoration: BoxDecoration(
                              color: Color(0xffE7E7E7),
                              borderRadius: BorderRadius.circular(40)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultMargin,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fasilitas Untukmu',
                                style: blackTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: medium,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  FacilityItem(
                                    name: 'Service 24 Jam',
                                    height: 10,
                                    imageUrl: 'assets/cs-icon.png',
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  FacilityItem(
                                    name: 'Asuransi',
                                    height: 3,
                                    imageUrl: 'assets/garansi-icon.png',
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  FacilityItem(
                                    name: 'Privasi',
                                    height: 4,
                                    imageUrl: 'assets/identitas-icon.png',
                                  ),
                                ],
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
                                'Pemilik Usaha',
                                style: blackTextStyle.copyWith(
                                    fontSize: 16, fontWeight: medium),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Row(children: [
                                Image.asset(
                                  "assets/img-guide1.png",
                                  height: 70,
                                  width: 70,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Rizky Setiawan",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 16, fontWeight: medium),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        "Flores, NTT",
                                        style: grey3TextStyle.copyWith(
                                            fontSize: 14, fontWeight: light),
                                      ),
                                    ],
                                  ),
                                ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 2),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                              4.5.toString(),
                                              style: blackTextStyle.copyWith(
                                                fontWeight: medium,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ]),
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
                                'Kata Mereka',
                                style: blackTextStyle.copyWith(
                                    fontSize: 16, fontWeight: medium),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              "Penyewa",
                                              style: grey3TextStyle.copyWith(
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
                                            'Tempat sewa disini sangat terpercaya, pelayannya ramah dan syaratnya mudah',
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
                                  GoToBookingLainPage(destination!));
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
