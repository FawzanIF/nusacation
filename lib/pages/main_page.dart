part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int? bottomNavBarIndex;
  final String? title;
  final url;

  MainPage({this.bottomNavBarIndex = 0, this.title, this.url});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int? bottomNavBarIndex;
  PageController? pageController;
  TextEditingController amountController = TextEditingController(text: 'Rp. 0');
  int selectedAmount = 0;

  @override
  void initState() {
    super.initState();

    bottomNavBarIndex = widget.bottomNavBarIndex;
    pageController = PageController(initialPage: bottomNavBarIndex!);
  }

  void showDialogd(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.only(top: 120),
            title: Center(
              child: Text('Isi Ulang',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: medium,
                  )),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            content: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        TextField(
                          onChanged: (text) {
                            String temp = '';

                            for (int i = 0; i < text.length; i++) {
                              temp += text.isDigit(i) ? text[i] : '';
                            }

                            setState(() {
                              selectedAmount = int.tryParse(temp) ?? 0;
                            });

                            amountController.text = NumberFormat.currency(
                                    locale: 'id_ID',
                                    symbol: 'Rp. ',
                                    decimalDigits: 0)
                                .format(selectedAmount);

                            amountController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: amountController.text.length));
                          },
                          controller: amountController,
                          decoration: InputDecoration(
                            labelStyle: greyTextFont,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "Jumlah",
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(top: 20, bottom: 14),
                            child: Text("Pilih Cepat", style: blackTextFont),
                          ),
                        ),
                        Wrap(
                          spacing: 20,
                          runSpacing: 14,
                          children: <Widget>[
                            // makeMoneyCard(
                            //   amount: 50000,
                            //   width: cardWidth,
                            // ),
                            // makeMoneyCard(
                            //   amount: 100000,
                            //   width: cardWidth,
                            // ),
                            // makeMoneyCard(
                            //   amount: 150000,
                            //   width: cardWidth,
                            // ),
                            // makeMoneyCard(
                            //   amount: 200000,
                            //   width: cardWidth,
                            // ),
                            // makeMoneyCard(
                            //   amount: 250000,
                            //   width: cardWidth,
                            // ),
                            // makeMoneyCard(
                            //   amount: 500000,
                            //   width: cardWidth,
                            // ),
                            // makeMoneyCard(
                            //   amount: 1000000,
                            //   width: cardWidth,
                            // ),
                            // makeMoneyCard(
                            //   amount: 2500000,
                            //   width: cardWidth,
                            // ),
                            // makeMoneyCard(
                            //   amount: 5000000,
                            //   width: cardWidth,
                            // )
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 55,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: BlocBuilder<UserBloc, UserState>(
                            builder: (_, userState) => ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  disabledBackgroundColor: Color(0xFFE4E4E4),
                                  backgroundColor: kBlueColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  "Isi Nusacash",
                                  style: whiteTextFont.copyWith(
                                      fontSize: 16,
                                      color: (selectedAmount > 0)
                                          ? Colors.white
                                          : Color(0xFFBEBEBE)),
                                ),
                                onPressed: (selectedAmount > 0)
                                    ? () {
                                        // context.read<PageBloc>().add(GoToSuccessPage(
                                        //     NusacationTransaction(
                                        //         userID: (userState as UserLoaded)
                                        //             .user
                                        //             .id,
                                        //         title: "Top Up Wallet",
                                        //         amount: selectedAmount,
                                        //         subtitle:
                                        //             "${DateTime.now().dayName}, ${DateTime.now().day} ${DateTime.now().monthName} ${DateTime.now().year}",
                                        //         time: DateTime.now())));
                                      }
                                    : null),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 40) / 4;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: accentColor2,
            ),
            SafeArea(
                child: Container(
              color: Color(0xFFF6F7F9),
            )),
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  bottomNavBarIndex = index;
                });
              },
              children: <Widget>[
                MenuPage(),
                TicketPage(),
                FavoritPage(),
                ProfilePage()
              ],
            ),
            createCustomBottomNavBar(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 66,
                width: 66,
                margin: EdgeInsets.only(bottom: 40),
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: kBlueColor,
                  child: SizedBox(
                    height: 44,
                    width: 44,
                    child: Image.asset("assets/ic-topup.png"),
                  ),
                  onPressed: () async {
                    context.read<PageBloc>().add(GoToTopUpPage(GoToMainPage()));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget createCustomBottomNavBar() => Align(
        alignment: Alignment.bottomCenter,
        child: ClipPath(
          clipper: BottomNavBarClipper(),
          child: Container(
            height: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: BottomNavigationBar(
                  elevation: 0,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  backgroundColor: kGrey2Color,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.black,
                  currentIndex: bottomNavBarIndex!,
                  onTap: (index) {
                    setState(() {
                      bottomNavBarIndex = index;
                      pageController!.jumpToPage(index);
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                        label: "",
                        icon: Container(
                          height: 26,
                          margin: EdgeInsets.only(bottom: 5, right: 10),
                          child: Image.asset(
                            (bottomNavBarIndex == 0)
                                ? "assets/ic-home-act.png"
                                : "assets/ic-home-inact.png",
                            height: 24,
                            width: 24,
                          ),
                        )),
                    BottomNavigationBarItem(
                        label: "",
                        icon: Container(
                          height: 26,
                          margin: EdgeInsets.only(bottom: 5, right: 42),
                          child: Image.asset(
                            (bottomNavBarIndex == 1)
                                ? "assets/ic-book-act.png"
                                : "assets/ic-book-inact.png",
                            height: 24,
                            width: 24,
                          ),
                        )),
                    // BottomNavigationBarItem(
                    //     label: "",
                    //     icon: Container(
                    //       height: 26,
                    //     )),
                    BottomNavigationBarItem(
                        label: "",
                        icon: Container(
                          height: 26,
                          margin: EdgeInsets.only(bottom: 5, left: 42),
                          child: Image.asset(
                            (bottomNavBarIndex == 2)
                                ? "assets/ic-like-act.png"
                                : "assets/ic-like-inact.png",
                            height: 24,
                            width: 24,
                          ),
                        )),
                    BottomNavigationBarItem(
                        label: "",
                        icon: Container(
                          height: 26,
                          margin: EdgeInsets.only(bottom: 5, left: 10),
                          child: Image.asset(
                            (bottomNavBarIndex == 3)
                                ? "assets/ic-prof-act.png"
                                : "assets/ic-prof-inact.png",
                            height: 24,
                            width: 24,
                          ),
                        ))
                  ]),
            ),
          ),
        ),
      );
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 38, 0);

    path.quadraticBezierTo(size.width / 2 - 38, 42, size.width / 2, 42);
    path.quadraticBezierTo(size.width / 2 + 38, 42, size.width / 2 + 38, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
