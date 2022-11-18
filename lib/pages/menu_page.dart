part of 'pages.dart';

class MenuPage extends StatefulWidget {
  final int bottomNavBarIndex;
  final String? title;
  final url;

  const MenuPage({super.key, this.bottomNavBarIndex = 0, this.title, this.url});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool _enabled = true;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final fb = FirebaseDatabase.instance;
  List<DestinationModel> destination = [];
  final List<String> imgList = [
    'assets/img_sing2.png',
    'assets/img_continue1.png',
    'assets/img_sing2.png',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
              if (userState is UserLoaded) {
                if (imageFileToUpload != null) {
                  uploadImage(imageFileToUpload!).then((downloadURL) {
                    imageFileToUpload = null;
                    context
                        .read<UserBloc>()
                        .add(UpdateData(profileImage: downloadURL));
                  });
                }

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                      
                      },
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: kBlueColor,
                            width: 3,
                          ),
                          image: DecorationImage(
                              // image: DecorationImage( image: true ? NetworkImage('someNetWorkLocation.com') : AssetImage('assets/images/noImageAvailable.png') as ImageProvider ),
                              image: (userState.user.profilePicture == ""
                                  ? AssetImage("assets/user_pic.png")
                                      as ImageProvider
                                  : NetworkImage(
                                      userState.user.profilePicture ??
                                          "No Data")),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hai, ${userState.user.name!}',
                              style: blackTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              NumberFormat.currency(
                                      locale: "id_ID",
                                      decimalDigits: 0,
                                      symbol: "Rp. ")
                                  .format(userState.user.balance ?? "0") + ' Nusacash',
                              style: grey3TextStyle.copyWith(fontSize: 14),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: kGoldColor),
                              child: Text(
                                'Gold',
                                style: whiteTextStyle.copyWith(
                                    fontWeight: light, fontSize: 12),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<PageBloc>().add(GoToEditProfilePage(
                            (userState as UserLoaded).user));
                      },
                      child: Container(
                        height: 54,
                        width: 54,
                        padding: EdgeInsets.only(left: 6, bottom: 2),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 0,
                              blurRadius: 20,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Image.asset(
                          "assets/btn-edit.png",
                          fit: BoxFit.contain,
                          width: 32,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return SpinKitFadingCircle(
                  color: kBlueColor,
                  size: 50,
                );
              }
            }),
          ),
        ]),
      );
    }

    Widget searchDestination() {
      return GestureDetector(
        onTap: () {
          context.read<PageBloc>().add(GoToSearchPage());
        },
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kWhiteColor,
          ),
          child: Row(
            children: [
              Icon(
                Icons.search_rounded,
                color: kGrey3Color,
                size: 36.0,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Temukan Tempat Impian Kamu',
                style: grey3TextStyle,
              ),
            ],
          ),
        ),
      );
    }

    Widget packetRecommended() {
      return Container(
        height: 200,
        margin: EdgeInsets.only(top: 14, bottom: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          // height: 198,
          // margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: BlocBuilder<PaketBloc, PaketState>(
            builder: (_, destinationState) {
              if (destinationState is PaketLoaded) {
                List<DestinationModel>? pakets = destinationState.paket;

                return Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        pauseAutoPlayOnTouch: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      items: pakets!
                          .map((item) => GestureDetector(
                                onTap: () {
                                  context
                                      .read<PageBloc>()
                                      .add(GoToDetailPaketPage(item));
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(item.imageUrl!),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 120,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                Colors.black.withOpacity(0),
                                                Colors.black.withOpacity(0.60),
                                              ])),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // GestureDetector(
                            //   onTap: () {},
                            //   child: Container(
                            //     padding: EdgeInsets.symmetric(
                            //         horizontal: 24, vertical: 6),
                            //     margin: EdgeInsets.only(left: 12, bottom: 24),
                            //     decoration: BoxDecoration(
                            //       color: kBlueColor,
                            //       borderRadius: BorderRadius.circular(50),
                            //     ),
                            //     child: Column(children: [
                            //       Text(
                            //         'Pesan',
                            //         style: whiteTextStyle.copyWith(
                            //           fontWeight: medium,
                            //           fontSize: 14,
                            //         ),
                            //       ),
                            //     ]),
                            //   ),
                            // ),
                            //
                            Container(
                              margin: EdgeInsets.only(left: 12, top: 12),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
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
                          ],
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 12, bottom: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: map<Widget>(imgList, (index, url) {
                              return Container(
                                width: 12.0,
                                height: 12.0,
                                margin: EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentIndex == index
                                      ? kBlueColor
                                      : kGrey2Color,
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              } else {
                return LoadingShimmerRecommended(_enabled);
              }
            },
          ),
        ),
      );
    }

    Widget recommended() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jelajahi Nusa Tenggara',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            packetRecommended(),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<PageBloc>().add(GoToHotelsPage());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.19,
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/ic-hotels.png",
                          height: 32,
                          width: 32,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Resort',
                          style: blueTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<PageBloc>().add(GoToTranportationPage());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.19,
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/ic-bus.png",
                          height: 32,
                          width: 32,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Transport',
                          style: blueTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<PageBloc>().add(GoToGuideTourPage());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.19,
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/ic-guide.png",
                          height: 32,
                          width: 32,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Pemandu',
                          style: blueTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<PageBloc>().add(GoToInfoPage());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.19,
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/ic-info.png",
                          height: 32,
                          width: 32,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Artikel',
                          style: blueTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget vacationSpotTitle() {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(
                'Rekomendasi Tempat',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 18,
                ),
              ),
            ),
            Icon(
              Icons.fiber_manual_record,
              size: 26,
              color: kBlueColor,
            ),
            Icon(
              Icons.fiber_manual_record,
              size: 26,
              color: kBlueColor,
            ),
          ],
        ),
      );
    }

    Widget vacationSpot() {
      return Container(
        margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
        constraints: BoxConstraints(
            minHeight: 100,
            minWidth: double.infinity,
            maxHeight: MediaQuery.of(context).size.height),
        child: BlocBuilder<DestinationBloc, DestinationState>(
          builder: (_, destinationState) {
            if (destinationState is DestinationLoaded) {
              List<DestinationModel>? destination =
                  destinationState.destinations;

              return ListView.builder(
                shrinkWrap: true,
                itemCount: destination!.length,
                itemBuilder: (_, index) => DestinationCard(
                  destination[index],
                  onTap: () {
                    context
                        .read<PageBloc>()
                        .add(GoToDetailDestinationPage(destination[index]));
                  },
                ),
              );
            } else {
              return LoadingShimmer(_enabled);
            }
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              SizedBox(
                height: 14,
              ),
              searchDestination(),
              recommended(),
              vacationSpotTitle(),
              SizedBox(
                height: 14,
              ),
              vacationSpot(),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
