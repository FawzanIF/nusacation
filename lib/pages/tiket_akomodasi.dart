part of 'pages.dart';

class AkomodasiTicket extends StatelessWidget {
  const AkomodasiTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<UserBloc, UserState>(
                builder: (_, userState) {
                  if (userState is UserLoaded) {
                    return MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection("dataTiketAkomodasi")
                              .where('user_id', isEqualTo: userState.user.id)
                              .snapshots(),
                          builder: (_, snapshot) {
                            if (!snapshot.hasData) {
                              return SpinKitCircle(
                                  color: kBlueColor, size: 100);
                            } else if (snapshot.data!.size.bitLength == 0) {
                              return Center(
                                child: Text(
                                    'Kamu Belum Memiliki Tiket Akomodasi',
                                    style: grey3TextStyle),
                              );
                            }
                            return AkomTicketList(
                                akomTicket: snapshot.data!.docs);
                          }),
                    );
                  } else {
                    return SpinKitFadingCircle(
                      color: kBlueColor,
                      size: 50,
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AkomTicketList extends StatelessWidget {
  final List<DocumentSnapshot> akomTicket;

  AkomTicketList({super.key, required this.akomTicket});
  var whatsapp = "+6282297145285";

  void customLaunch(command) async {
    await launch(command);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 60),
        shrinkWrap: true,
        itemCount: akomTicket.length,
        itemBuilder: (_, index) {
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 20.0, left: 20, bottom: 10),
                child: ExpansionTileCard(
                  borderRadius: BorderRadius.circular(10),
                  baseColor: kWhiteColor,
                  expandedColor: Color.fromARGB(255, 243, 254, 255),
                  key: key,
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        NetworkImage(akomTicket[index]["Gambar"].toString()),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(
                    akomTicket[index]["Place"].toString(),
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      'Jadwal : ' + akomTicket[index]["Date"].toString(),
                      style: grey3TextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  children: <Widget>[
                    Divider(
                      thickness: 1.0,
                      height: 1.0,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Column(
                          children: [
                            Row(children: [
                              Icon(Icons.check_circle_outline),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Text(
                                    'Tiket Ini berlaku untuk ' +
                                        akomTicket[index]["Traveler"]
                                            .toString() +
                                        ' Hari Sewa',
                                    style:
                                        blackTextStyle.copyWith(fontSize: 13)),
                              ),
                            ]),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.check_circle_outline),
                                SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: Text(
                                      'Jangan berikan QR Code ke sembarang orang!',
                                      style: blackTextStyle.copyWith(
                                          fontSize: 13)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(Icons.check_circle_outline),
                                SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: Text('Pastikan datang tepat waktu!',
                                      style: blackTextStyle.copyWith(
                                          fontSize: 13)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonBar(
                        alignment: MainAxisAlignment.spaceAround,
                        buttonHeight: 52.0,
                        buttonMinWidth: 90.0,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      SimpleDialog(
                                        title: Center(
                                          child: Text(
                                              "Scan QR Code dibawah Ini",
                                              style: blackTextStyle.copyWith(
                                                  fontWeight: semiBold,
                                                  fontSize: 16)),
                                        ),
                                        children: [
                                          Image.asset('assets/qrcode.png')
                                        ],
                                      ));
                            },
                            child: Icon(Icons.qr_code_scanner),
                          ),
                          GestureDetector(
                            onTap: () {
                              customLaunch(
                                  "https://wa.me/+62822-9714-5285?text=Halo,%20Saya%20Ingin%20Konfirmasi%20Pemesanan%20Saya");
                            },
                            child: Icon(Icons.chat_outlined),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: kBlueColor,
                              ),
                              height: 40,
                              width: MediaQuery.of(context).size.width / 3,
                              child: Center(
                                  child: Text(
                                'Rp. ' + akomTicket[index]["Price"].toString(),
                                textAlign: TextAlign.center,
                                style: whiteTextStyle.copyWith(
                                  fontWeight: medium,
                                  fontSize: 14,
                                ),
                              )))
                        ])
                  ],
                ),
              ),
            ],
          );
        });
  }
}
