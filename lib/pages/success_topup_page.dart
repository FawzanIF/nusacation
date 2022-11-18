part of 'pages.dart';

class SuccessTopUpPage extends StatelessWidget {
  final DestinationModel? destination;
  final NusacationTransaction? transaction;

  SuccessTopUpPage(this.destination, this.transaction);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: FutureBuilder(
          future: processingTopUp(context),
          builder: (_, snapshot) => (snapshot.connectionState ==
                  ConnectionState.done)
              ? Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        margin: EdgeInsets.only(bottom: 70),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(destination == null
                                    ? "assets/ic-success-topup.png"
                                    : "assets/ticket_done.png"))),
                      ),
                      Text(
                        (destination == null)
                            ? "Saldo Kamu Bertambah!"
                            : "Happy Watching!",
                        style: blackTextFont.copyWith(fontSize: 20),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Kamu Berhasil Isi Ulang\nNusacash!",
                        textAlign: TextAlign.center,
                        style: blackTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                      Container(
                        height: 45,
                        width: 250,
                        margin: EdgeInsets.only(top: 70, bottom: 20),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: kBlueColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Text(
                              'Menu Utama',
                              style: whiteTextFont.copyWith(fontSize: 16),
                            ),
                            onPressed: () {
                              context
                                  .read<PageBloc>()
                                  .add(GoToMainPage(bottomNavBarIndex: 1));


                            }),
                      ),
                    ],
                  ),
              )
              : Center(
                  child: SpinKitFadingCircle(
                    color: kBlueColor,
                    size: 50,
                  ),
                )),
    );
  }

  Future<void> processingTopUp(BuildContext context) async {
    context.read<UserBloc>().add(TopUp(transaction!.amount));
  }
}
