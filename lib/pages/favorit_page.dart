part of 'pages.dart';

class FavoritPage extends StatefulWidget {
  const FavoritPage({super.key});

  @override
  State<FavoritPage> createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
  @override
  Widget build(BuildContext context) {
    Widget emptyWishlist() {
      return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 12,
            ),
            Text(
              'Kamu Belum Memiliki Tempat Favorit',
              style: grey3TextStyle,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        color: kBackgroundColor,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: context
              .watch<FavoritBloc>()
              .wishlist
              .map(
                (destination) => FavoritDestinationCard(destination),
              )
              .toList(),
        ),
      );
    }

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: context.watch<FavoritBloc>().wishlist.length == 0
              ? Container(
                  margin: EdgeInsets.only(
                      left: defaultMargin, right: defaultMargin),
                  child: Column(children: [
                    SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Text(
                        'Favorit',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                    context.watch<FavoritBloc>().wishlist.length == 0
                        ? SizedBox(
                            height: 0,
                          )
                        : SizedBox(
                            height: 12,
                          ),
                    Container(
                      child: context.watch<FavoritBloc>().wishlist.length == 0
                          ? emptyWishlist()
                          : content(),
                    )

                    // DestinationCard()
                  ]),
                )
              : SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: defaultMargin, right: defaultMargin),
                    child: Column(children: [
                      SizedBox(
                        height: 24,
                      ),
                      Center(
                        child: Text(
                          'Favorit',
                          style: blackTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                      context.watch<FavoritBloc>().wishlist.length == 0
                          ? SizedBox(
                              height: 0,
                            )
                          : SizedBox(
                              height: 12,
                            ),
                      Container(
                        child: context.watch<FavoritBloc>().wishlist.length == 0
                            ? emptyWishlist()
                            : content(),
                      )

                      // DestinationCard()
                    ]),
                  ),
                ),
        ));
  }
}
