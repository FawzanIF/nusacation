part of 'pages.dart';

class BookingPage extends StatefulWidget {
  final DestinationModel? booking;

  const BookingPage(this.booking, {super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int jml = 1;
  String time = 'Pilih Tanggal';
  bool dateService = true;
  DateTime _dateTime = DateTime.now();
  String payment = 'Pilih Metode\nPembayaran';

  void _add() {
    setState(() {
      jml += 1;
    });
  }

  void _remove() {
    setState(() {
      jml -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context.read<PageBloc>().add(GoToDetailPaketPage(widget.booking!));

          return false;
        },
        child: Scaffold(
            backgroundColor: kBackgroundColor,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  context
                      .read<PageBloc>()
                      .add(GoToDetailPaketPage(widget.booking!));
                },
              ),
              title: Text(
                "Pesanan Kamu",
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              centerTitle: true,
            ),
            body: SafeArea(
              child: ListView(children: [
                Container(
                    margin: EdgeInsets.only(
                      top: 10,
                      left: defaultMargin,
                      right: defaultMargin,
                    ),
                    child: BlocBuilder<UserBloc, UserState>(
                        builder: (_, userState) {
                      if (userState is UserLoaded) {
                        if (imageFileToUpload != null) {
                          uploadImage(imageFileToUpload!).then((downloadURL) {
                            imageFileToUpload = null;
                            context
                                .read<UserBloc>()
                                .add(UpdateData(profileImage: downloadURL));
                          });
                        }
                        return Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Jumlah Nusacash",
                                        style: blackTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          SpinKitFadingCircle(
                                            color: kBlueColor,
                                            size: 50,
                                          ),
                                          Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: (userState.user
                                                            .profilePicture ==
                                                        ""
                                                    ? AssetImage(
                                                            "assets/user_pic.png")
                                                        as ImageProvider
                                                    : NetworkImage(userState
                                                            .user
                                                            .profilePicture ??
                                                        "No Data")),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              child: Text(
                                                r'Rp. ' +
                                                    userState.user.balance
                                                        .toString(),
                                                style: blackTextStyle.copyWith(
                                                  fontSize: 18,
                                                  fontWeight: medium,
                                                ),
                                                overflow: TextOverflow.clip,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              "Sisa Nusacash",
                                              style: greyTextStyle.copyWith(
                                                fontWeight: light,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ])),
                            SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    'Daftar Pesanan',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: semiBold,
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
                            SizedBox(
                              height: 18,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            width: 70,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(widget
                                                        .booking!.imageUrl!)))),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.booking!.name!,
                                                style: blackTextStyle.copyWith(
                                                  fontWeight: medium,
                                                  fontSize: 18,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                widget.booking!.location!,
                                                style: greyTextStyle.copyWith(
                                                  fontWeight: light,
                                                  fontSize: 14,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RowDetails(
                                      det1: "Kode Tiket",
                                      det2: randomAlphaNumeric(15),
                                      clr: kBlueColor,
                                      weight: semiBold,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.check_circle_outline,
                                              color: Colors.blue,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text("Jumlah Paket",
                                                style: blackTextStyle),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 120,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                      onTap: jml >= 2
                                                          ? _remove
                                                          : null,
                                                      child: Container(
                                                          decoration: BoxDecoration(
                                                              color: kBlueColor,
                                                              border: Border.all(
                                                                  color:
                                                                      kBlueColor),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50)),
                                                          child: Icon(
                                                              Icons.remove,
                                                              color: Colors
                                                                  .white))),
                                                  Text(jml.toString()),
                                                  GestureDetector(
                                                      onTap: _add,
                                                      child: Container(
                                                          decoration: BoxDecoration(
                                                              color: kBlueColor,
                                                              border: Border.all(
                                                                  color:
                                                                      kBlueColor),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50)),
                                                          child: Icon(Icons.add,
                                                              color: Colors
                                                                  .white)))
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        DateTime? newDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: _dateTime,
                                                firstDate: DateTime.now(),
                                                lastDate: DateTime(2024));

                                        if (newDate == null) {
                                          return;
                                        } else {
                                          setState(() => _dateTime = newDate);
                                        }
                                        time = DateFormat('dd-MM-yyyy')
                                            .format(_dateTime);
                                      },
                                      child: RowDetails(
                                        det1: 'Tanggal',
                                        det2: time.toString(),
                                        clr: (_dateTime != 'Pilih Tanggal')
                                            ? kRedColor
                                            : kBlackColor,
                                        weight: semiBold,
                                      ),
                                    ),
                                    RowDetails(
                                      det1: 'Asuransi',
                                      det2: 'ADA',
                                      clr: kGreenColor,
                                      weight: semiBold,
                                    ),
                                    RowDetails(
                                      det1: 'Pajak',
                                      det2: 'TIDAK ADA',
                                      clr: kBlackColor,
                                      weight: semiBold,
                                    ),
                                    RowDetails(
                                      det1: 'Harga (per Tiket)',
                                      det2: r"Rp. " +
                                          widget.booking!.price!.toString(),
                                      clr: kBlackColor,
                                      weight: semiBold,
                                    ),
                                    RowDetails(
                                      det1: 'Total Harga',
                                      det2: r"Rp. " +
                                          "${jml * widget.booking!.price!}",
                                      clr: kBlueColor,
                                      weight: semiBold,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                SimpleDialog(
                                                  title: Text(
                                                      "Metode Pembayaran",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                        fontWeight: semiBold,
                                                      )),
                                                  children: [
                                                    ListTile(
                                                      leading: Image.asset(
                                                          "assets/icon_balance.png",
                                                          height: 45),
                                                      title: Text("My Nusacash",
                                                          style:
                                                              blackTextStyle),
                                                      onTap: () {
                                                        setState(() {
                                                          payment =
                                                              "My Nusacash";
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    ListTile(
                                                      leading: Image.asset(
                                                          "assets/ovo.png"),
                                                      title: Text("OVO",
                                                          style:
                                                              blackTextStyle),
                                                      onTap: () {
                                                        setState(() {
                                                          payment = "OVO";
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    ListTile(
                                                      leading: Image.asset(
                                                          "assets/bca.png"),
                                                      title: Text(
                                                          "Bank Central Asia",
                                                          style:
                                                              blackTextStyle),
                                                      onTap: () {
                                                        setState(() {
                                                          payment =
                                                              "Bank Central Asia";
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    ListTile(
                                                      leading: Image.asset(
                                                          "assets/jenius.png"),
                                                      title: Text("Jenius",
                                                          style:
                                                              blackTextStyle),
                                                      onTap: () {
                                                        setState(() {
                                                          payment = "Jenius";
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    ListTile(
                                                      leading: Image.asset(
                                                          "assets/paypal.png"),
                                                      title: Text("PayPal",
                                                          style:
                                                              blackTextStyle),
                                                      onTap: () {
                                                        setState(() {
                                                          payment = "PayPal";
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    ListTile(
                                                      leading: Image.asset(
                                                          "assets/cash.png"),
                                                      title: Text(
                                                          "Bayar Ditempat",
                                                          style:
                                                              blackTextStyle),
                                                      onTap: () {
                                                        setState(() {
                                                          payment =
                                                              "Bayar Ditempat";
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ],
                                                ));
                                      },
                                      child: RowDetails(
                                        det1: 'Metode Pembayaran',
                                        det2: payment,
                                        clr: (payment ==
                                                'Pilih Metode\nPembayaran')
                                            ? kRedColor
                                            : kBlackColor,
                                        weight: semiBold,
                                      ),
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            SizedBox(
                              height: 54,
                              width: MediaQuery.of(context).size.width - 50,
                              child: TextButton(
                                onPressed: () {
                                  if ((userState.user.balance! >=
                                          (jml * widget.booking!.price!)) &&
                                      time != 'Pilih Tanggal' &&
                                      payment == 'My Nusacash') {
                                    Alert(
                                      context: context,
                                      type: AlertType.warning,
                                      title: "Pesan Sekarang?",
                                      desc:
                                          "Pastikan Data Sudah Diisi dengan Benar!",
                                      buttons: [
                                        DialogButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          color: kRedColor,
                                          child: Text(
                                            "Batal",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                        DialogButton(
                                          onPressed: () {
                                            context.read<PageBloc>().add(
                                                GoToSuccessPage(
                                                    userState.user));
                                            FirebaseFirestore.instance
                                                .runTransaction(
                                                    (transaction) async {
                                              CollectionReference reference =
                                                  FirebaseFirestore.instance
                                                      .collection("dataTiket");
                                              await reference.add({
                                                "user_id": userState.user.id,
                                                "Place": widget.booking!.name!,
                                                "Date": time,
                                                "Price":
                                                    "${jml * widget.booking!.price!}",
                                                "Traveler": jml,
                                                "Payment": payment,
                                              });
                                            });
                                            Navigator.pop(context);
                                          },
                                          width: 180,
                                          child: Text(
                                            "Pesan!",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ).show();
                                  } else if (time != 'Pilih Tanggal' &&
                                      payment != 'My Nusacash' &&
                                      payment != 'Pilih Metode\nPembayaran') {
                                    Alert(
                                      context: context,
                                      type: AlertType.warning,
                                      title: "Pesan Sekarang?",
                                      desc:
                                          "Pastikan Data Sudah Diisi dengan Benar!",
                                      style: AlertStyle(
                                        titleStyle: blackTextStyle.copyWith(
                                          fontWeight: semiBold,
                                        ),
                                        descStyle: greyTextStyle,
                                      ),
                                      buttons: [
                                        DialogButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          color: kRedColor,
                                          child: Text(
                                            "Batal",
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                        DialogButton(
                                          onPressed: () {
                                            context.read<PageBloc>().add(
                                                GoToSuccessPage(
                                                    userState.user));
                                            FirebaseFirestore.instance
                                                .runTransaction(
                                                    (transaction) async {
                                              CollectionReference reference =
                                                  FirebaseFirestore.instance
                                                      .collection("dataTiket");
                                              await reference.add({
                                                "user_id": userState.user.id,
                                                "Place": widget.booking!.name!,
                                                "Date": time,
                                                "Price":
                                                    "${jml * widget.booking!.price!}",
                                                "Traveler": jml,
                                                "Payment": payment,
                                                "City": widget.booking!.city
                                              });
                                            });
                                            Navigator.pop(context);
                                          },
                                          width: 180,
                                          child: Text(
                                            "Pesan!",
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ).show();
                                  } else {
                                    Alert(
                                      context: context,
                                      type: AlertType.error,
                                      title: "PEMESANAN GAGAL",
                                      style: AlertStyle(
                                        titleStyle: blackTextStyle.copyWith(
                                          fontWeight: semiBold,
                                        ),
                                        descStyle: greyTextStyle,
                                      ),
                                      desc:
                                          "Periksa Tanggal atau Nusacash kamu!",
                                      buttons: [
                                        DialogButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          width: 120,
                                          child: Text(
                                            "Mengerti",
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                        DialogButton(
                                          onPressed: () async {
                                            context.read<PageBloc>().add(
                                                GoToTopUpPage(GoToMainPage()));
                                            Navigator.pop(context);
                                          },
                                          width: 120,
                                          child: Text(
                                            "Isi Ulang",
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        )
                                      ],
                                    ).show();
                                  }
                                },
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  backgroundColor: kBlueColor,
                                ),
                                child: Text(
                                  'Pesan Sekarang',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: semiBold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      } else {
                        return SpinKitFadingCircle(
                          color: kBlueColor,
                          size: 50,
                        );
                      }
                    })),
              ]),
            )));
  }
}
