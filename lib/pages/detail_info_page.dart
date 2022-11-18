part of 'pages.dart';

class DetailInfoPage extends StatelessWidget {
  final InfoModel? info;

  DetailInfoPage(this.info);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToInfoPage());

        return false;
      },
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          bottom: true,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 8, top: 12, bottom: 12, right: 12),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: kWhiteColor),
                        child: InkWell(
                          onTap: () {
                            context.read<PageBloc>().add(GoToInfoPage());
                          },
                          child: Image.asset(
                            'assets/btn-back.png',
                            width: 28,
                            height: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                        decoration: BoxDecoration(
                          color: kBlueColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Column(children: [
                          Text(
                            'Infocation',
                            style: whiteTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 14,
                            ),
                          ),
                        ]),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/ic-fire.png",
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              'Trending',
                              style: grey3TextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    info!.title!,
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(info!.creatorImage!))),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            info!.creatorName!,
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          info!.time!,
                          style: grey3TextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(info!.imageUrl!),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    info!.deskripsi!,
                    style: grey3TextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
